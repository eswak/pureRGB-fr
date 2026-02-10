#!/usr/bin/env python3
"""
Parcourt tous les .asm du dossier text/, trouve les lignes text/line/cont/para
dont la chaîne dépasse 18 caractères d'affichage (les tokens <...> comptent pour 1),
et découpe en plusieurs lignes avec 'cont' en respectant les coupures de mots.
"""

import re
import os
from pathlib import Path

# Dossier des fichiers .asm (même dossier que le script)
TEXT_DIR = Path(__file__).resolve().parent
MAX_DISPLAY_LEN = 18

# Directive pour les lignes de suite (toujours cont)
CONT = "cont"


def display_length(s: str) -> int:
    """Longueur affichée: chaque token <...> compte pour 1 caractère."""
    t = re.sub(r"<[^>]+>", "X", s)
    return len(t)


def split_string_to_lines(content: str) -> list[str]:
    """Découpe le texte en lignes de <= MAX_DISPLAY_LEN caractères (aux espaces)."""
    if display_length(content) <= MAX_DISPLAY_LEN:
        return [content] if content else []

    # Mots = tokens <...> ou suites de non-espaces
    words = re.findall(r"<[^>]+>|\S+", content)
    if not words:
        return [content] if content.strip() else []

    lines = []
    current = []
    current_len = 0

    for word in words:
        word_display = 1 if (word.startswith("<") and word.endswith(">")) else len(word)
        need_space = 1 if current else 0

        if current_len + need_space + word_display > MAX_DISPLAY_LEN and current:
            lines.append(" ".join(current))
            current = [word]
            current_len = word_display
        else:
            if current:
                current_len += 1
            current.append(word)
            current_len += word_display

    if current:
        lines.append(" ".join(current))

    return lines


def process_line(match) -> str:
    indent, directive, string, tail = match.groups()
    if display_length(string) <= MAX_DISPLAY_LEN:
        return match.group(0)

    lines = split_string_to_lines(string)
    if len(lines) <= 1:
        return match.group(0)

    # Première ligne: même directive (text/line/cont/para)
    # Lignes suivantes: cont
    out = []
    for i, part in enumerate(lines):
        d = directive if i == 0 else CONT
        out.append(f'{indent}{d} "{part}"')
    return "\n".join(out) + (tail or "")


def process_file(path: Path) -> tuple[bool, int]:
    """Retourne (modifié, nombre de lignes longues trouvées)."""
    text = path.read_text(encoding="utf-8")
    # Ligne avec text/line/cont/para "..." et optionnel @ ou rien après
    pattern = re.compile(
        r'^(\s*)(text|line|cont|para)\s+"([^"]*)"(\s*(?:@.*)?)$',
        re.MULTILINE,
    )
    count = 0

    def repl(m):
        nonlocal count
        s = m.group(3)
        if display_length(s) > MAX_DISPLAY_LEN:
            count += 1
        return process_line(m)

    new_text = pattern.sub(repl, text)
    if new_text != text:
        path.write_text(new_text, encoding="utf-8")
        return True, count
    return False, count


def main():
    total_files = 0
    total_long = 0
    modified = []

    for path in sorted(TEXT_DIR.glob("*.asm")):
        if path.name == "wrap_long_lines.py":
            continue
        changed, n = process_file(path)
        if n:
            total_files += 1
            total_long += n
        if changed:
            modified.append(path.name)

    if modified:
        print("Fichiers modifiés (retours à la ligne ajoutés):")
        for name in modified:
            print(f"  {name}")
    print(f"\nLignes longues trouvées: {total_long} dans {total_files} fichier(s).")


if __name__ == "__main__":
    main()
