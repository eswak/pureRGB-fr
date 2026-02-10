SECTION "GBC WRAM", WRAMX
; wram that can be only used on GBC, switched out with the addresses of section WRAM 1 if 2 is written to rSVBK
; starts at address $d000 just like section WRAM 1
; Note: wGBCFullPalBuffer moved to WRAM bank 0 (wram.asm) in UNION to match shinpokered and avoid bank switching issues