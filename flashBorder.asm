;============================================================
; Flash border 
;============================================================

!cpu 6502
!to "build/test.prg",cbm    ; output file

;============================================================
; BASIC loader with start address $c000
;============================================================

           * = $0801

           lda #$00
           tax
           tay
           jsr $1000 ; initialize music

mainloop:  lda $d012    ; load $d012
           cmp #$80     ; is it equal to #$80?
           bne mainloop ; if not, keep checking

           inc $d020    ; inc border colour
           jsr $1003    ; jump to music play routine
           dec $d020    ; dec border colour
           jmp mainloop ; keep looping