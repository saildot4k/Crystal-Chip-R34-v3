TARGET BIN,R5900

REGDEF BPCM = 11
REGDEF BDAM = 9
REGDEF DCIC = 7
REGDEF BDA = 5
REGDEF BPC = 3

DCIC_WR EQU (1 << 27)
DCIC_RD EQU (1 << 26)
DCIC_DA EQU (1 << 25)
DCIC_PC EQU (1 << 24)

INCLUDE "MACROS.S"

CPU_TYPE EQU 2

_F_CC_DF_Detect         EQU 1
_F_CC_BurstExtraIn      EQU 1
_F_CC_SPI_ExchangeByte  EQU 1
_F_CC_DF_SendCmd        EQU 1
_F_CC_SPI_TransferBurstIn      EQU 1
_F_CC_DF_ReadStatus     EQU 1
_F_CC_DF_Read           EQU 1

code                    SEGMENT PAYLOAD_ADDR

main                    PROC

                        or      s0, zero, a0                            ; preserve args to IOPBOOT
                        or      s1, zero, a1
                        or      s2, zero, a2

; set hwbp on execution of BFC4A44C
                        mtc0    zero, DCIC                              ; disable all breakpoints

                        la      t0, dbgExVector
                        lw      t1, 0x00(t0)
                        lw      t2, 0x04(t0)
                        sw      t1, 0x40(zero)
                        sw      t2, 0x44(zero)
                        lw      t1, 0x08(t0)
                        lw      t2, 0x0C(t0)
                        sw      t1, 0x48(zero)
                        sw      t2, 0x4C(zero)

                        li      at, 0x1FFFFFFF
                        mtc0    at, BPCM
                        nop
                        nop

                        li      at, 0xBFC4A44C
                        mtc0    at, BPC
                        nop
                        nop

                        li      at, (0xE0800000 | DCIC_PC)
                        mtc0    at, DCIC
                        nop
                        nop

_done:
                        or      a0, zero, s0                            ; restore args to IOPBOOT
                        or      a1, zero, s1
                        li      at, 0xBFC4A004
                        jr      at                                      ; call IOPBOOT
                        or      a2, zero, s2

main                    ENDP

; called when IOPBOOT is about to JALR to LOADCORE's entry point at 0xBFC4A44C
Hook_ExecLOADCORE       PROC

                        or      s0, zero, a1                            ; s0 = address of start of LOADCORE(added by dbg ex handler)
                        or      s1, zero, a0                            ; s1 = &loadcore_param

; Load our module from CC dataflash

                        jal     CC_DF_Detect
                        nop

                        li      a0, (8 + 7)
                        la      a1, fwfs_index
                        jal     CC_DF_Read                              ; load the FWFS index
                        li      a2, 0x40

                        li      s2, 0x00190000

                        or      a1, zero, s2
                        jal     LoadFileFWFS                            ; Load IOPMAN.IRX
                        li      a0, 1
                        
                        sw      v0, -4(s2)

                        blez    v0, _done                               ; done if failed loading IOPMAN.IRX
                        or      s3, zero, v0                            ; s3 = sizeof(IRX_iopman)

; Have LOADCORE temporarily allocate the memory surrounding our module during module loading so it doesn't
;   get clobbered.
                        sw      s2, 0x10(s1)                            ; lcparam.addr = &ourModule
                        sw      s3, 0x14(s1)                            ; lcparam.size = sizeof(ourModule)

; Add our module to the start of the module list that LOADCORE should load.

                        lw      t0, 0x18(s1)                            ; t0 = lcparam.num_mods
                        nop
                        addiu   at, t0, 1
                        sw      at, 0x18(s1)                            ; loadcore_param.num_mods++

                        lw      t1, 0x1C(s1)

                        la      t2, moduleList
                        sw      t2, 0x1C(s1)

                        lw      t3, 0x00(t1)                            ; &ROM0.SYSMEM
                        lw      t4, 0x04(t1)                            ; &ROM0.LOADCORE
                        addiu   t1, t1, 8

                        sw      t3, 0x00(t2)                            ; copy SYSMEM and LOADCORE module addresses to the new list
                        sw      t4, 0x04(t2)
                        sw      s2, 0x08(t2)                            ; add IOPMAN module as 3rd module to be loaded(first to be loaded by LOADCORE)
                        addiu   t2, t2, 0x0C

                        addiu   t0, t0, -2                              ; copy the remaining module addresses to the new list.
_incLoop:
                        blez    t0, _done                               ; advance each entry in the module list
                        addiu   t0, t0, -1

                        lw      at, 0x00(t1)
                        addiu   t1, t1, 4
                        sw      at, 0x00(t2)
                        bu      _incLoop
                        addiu   t2, t2, 4

_done:
                        jr      s0                                      ; Execute start of LOADCORE
                        or      a0, zero, s1

Hook_ExecLOADCORE       ENDP

dbgExVector             PROC
                        la      k0, dbgExHandler
                        jr      k0
                        nop
dbgExVector             ENDP

dbgExHandler            PROC
                        mtc0    zero, DCIC
                        or      a1, zero, v0
                        mfc0    k0, EPC
                        la      v0, Hook_ExecLOADCORE
                        jr      k0
                        DW      0x42000010                              ; rfe
dbgExHandler            ENDP

moduleList:             DW      32 DUP(0)

INCLUDE "CCHW.S"
INCLUDE "N2E.S"
INCLUDE "FWFS.S"

fwfs_index:
                        DB      16 DUP(0)
                        DB      16 DUP(0)
                        DB      16 DUP(0)
                        DB      16 DUP(0)

code                    ENDS
