;============================================================
; Flash boarder 
;============================================================

!cpu 6502
!to "build/test.prg",cbm    ; output file

;============================================================
; BASIC loader with start address $c000
;============================================================

* = $0801                               ; BASIC start address (#2049)
!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000...
!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152

           lda #$00      ; Put the value 0 in accumulator
           sta $d020     ; Put value of acc in $d020
           sta $d021     ; Put value of acc in $d021
           tax           ; Put value of acc in x reg
           lda #$20      ; Put the value $20 in acc
           
clrloop:   sta $0400,x   ; Put value of acc in $0400 + value in x reg
           sta $0500,x   
           sta $0600,x   
           sta $0700,x
           dex            ; Decrement value in x reg
           bne clrloop    ; If not zero, branch to clrloop