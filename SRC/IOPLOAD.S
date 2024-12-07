;
; CrystalChip IOPBOOT Patch Loader application v1.00 (c) 2007 Crystal Chips http://www.crystal-chips.com/
;
; !! Total size must not exceed 3072 bytes !!
;
; This patch gets applied to rom0:IOPBOOT as it's being executed by IOP.
;
; Function:
;   generates a simply "copy" function in IOP RAM at IOP_COPY_ADDR which copies the payload
;   to IOP_PAYLOAD_ADDR then jumps to IOP_PAYLOAD_ADDR.
;
; See IOPPAY.S for payload code.
;

TARGET BIN

INCLUDE "macros.inc"

code                    SEGMENT 0

IOP_COPY_ADDR           EQU 0xA0000800
IOP_PAYLOAD_ADDR        EQU 0xA0180000

main                    PROC

                        li      t7, IOP_COPY_ADDR                       ; destination address for "copy"

                                                                        ; _l1:
                        li      at, 0x8D210000                          ; lw      at, 0(t1)
                        sw      at, 0x00(t7)

                        li      at, 0x25290004                          ; addiu   t1, t1, 4
                        sw      at, 0x04(t7)

                        li      at, 0xAD010000                          ; sw      at, 0(t0)
                        sw      at, 0x08(t7)

                        li      at, 0x152AFFFC                          ; bne     t1, t2, _l1
                        sw      at, 0x0C(t7)

                        li      at, 0x25080004                          ; addiu   t0, t0, 4
                        sw      at, 0x10(t7)

                        li      at, 0x01600008                          ; jr      t3
                        sw      at, 0x14(t7)

                        sw      zero, 0x18(t7)                          ; nop

                        li      t0, IOP_PAYLOAD_ADDR                    ; destination address

                        li      t1, 0xBFC00000                          ; source start address

                        li      t2, (0xBFC00000 + (3072 - payload))     ; source end address

                        li      t3, IOP_PAYLOAD_ADDR                    ; entry point address

                        jr      t7
                        nop

main                    ENDP

payload                 PROC
INCLUDE BINARY "..\TMP\IOPPAY.BIN"
payload                 ENDP

code                    ENDS

MESSAGE "loader size:  ", code.main._size
MESSAGE "payload size: ", code.payload._size
MESSAGE "total size:   ", code._size

IF code.main._size > 3072
ERROR "!!!! Total size is too great !!!!"
ENDIF
