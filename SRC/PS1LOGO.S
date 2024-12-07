;
; Example PS1 "LOGO" replacement file for CC1.0.  Simply clears TBIN's "shouldCheckDisc"
;   variable and returns, skipping the logo display and disc licensing checks which decreases
;   PS1 disc load times.
;

INCLUDE "macros.inc"

TARGET BIN

MAX_FILE_SIZE           EQU     0xC00                                   ; 3k max!

code                    SEGMENT 0x0002FFF8

                        DW      0x00030000
                        DW      __data_end - __data_start

__data_start:

main                    PROC

                        lui         t0, 0xA001
                        sw          zero, 0xDFFC(t0)                    ; clear PS1 checks on Exec() in TBIN
                        jr          ra
                        nop

main                    ENDP

__data_end:
code                    ENDS
IF code._size > MAX_FILE_SIZE
ERROR "!!!!!!! ERROR !!!!!!!    Your file size, ", code._size, " bytes, is greater than max file size, ", MAX_FILE_SIZE, " bytes!"
ELSE
MESSAGE "PS1LOGO File size: ", code._size
ENDIF
