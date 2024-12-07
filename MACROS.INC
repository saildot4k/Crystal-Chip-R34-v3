; Basic macros used by the CrystalChip firmware sources.

la                      MACRO reg, val
IF ((val >> 16) & 0xFFFF) != 0
                        lui         reg, ((val >> 16) & 0xFFFF)
IF (val & 0xFFFF) != 0
                        ori         reg, reg, (val & 0xFFFF)
ENDIF
ELSE
                        ori         reg, zero, (val & 0xFFFF)
ENDIF
la                      ENDM

li                      MACRO reg, val
IF ((val >> 16) & 0xFFFF) != 0
                        lui         reg, ((val >> 16) & 0xFFFF)
IF (val & 0xFFFF) != 0
                        ori         reg, reg, (val & 0xFFFF)
ENDIF
ELSE
                        ori         reg, zero, (val & 0xFFFF)
ENDIF
li                      ENDM

bu                      MACRO off
                        bgez        zero, off
bu                      ENDM

bual                    MACRO off
                        bgezal      zero, off
bual                    ENDM

M_DI                    MACRO temp1, temp2

                        di
                        sync.p
                        mfc0        temp1, Status
                        nop
                        lui         temp2, 0x0001
                        and         temp2, temp1, temp2
                        bnez        temp2, $-0x18
                        nop

M_DI                    ENDM

M_KMODE                 MACRO       temp1, temp2
                        mfc0        temp1, Status
                        li          temp2, 0xFFFFFFE7
                        and         temp1, temp1, temp2
                        mtc0        temp1, Status
                        sync.p
M_KMODE                 ENDM

M_UMODE                 MACRO       temp1, temp2
                        mfc0        temp1, Status
                        li          temp2, 0xFFFFFFE7
                        and         temp1, temp1, temp2
                        ori         temp1, temp1, 0x0010
                        mtc0        temp1, Status
                        sync.p
M_UMODE                 ENDM
