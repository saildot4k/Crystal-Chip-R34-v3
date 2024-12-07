;
; PS1 LOGO patch for v14 consoles.
;

INCLUDE "macros.inc"

TARGET BIN

MAX_FILE_SIZE           EQU     0xC00                                   ; 3k max!

code                    SEGMENT 0x0002FFF8

                        DW      0xAFA3001C                              ; sw v1, 0x001C(sp)
                        DW      0x0FF16201                              ; jal $BFC58804

main                    PROC

                        nop
                        nop
                        lui         t6, 0xA001
                        sw          zero, 0xdffc(t6)
                        lui         t6, 0x0003
                        lui         t7, 0x03e0
                        ori         t7, t7, 0x0008
                        sw          t7, 0(t6)
                        lui         t7, 0
                        sw          t7, 4(t6)
                        jr          ra
                        nop

main                    ENDP

code                    ENDS
