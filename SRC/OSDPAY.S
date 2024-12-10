;
; OSDSYS Hook v1.00 (c) 2004-2007 Crystal Chips http://www.crystal-chips.com/
;
;
; This application is loaded and executed in EE RAM from EEPROM/DataFlash by LOADER.S
;
; This file is common for all revisions of Crystal Chips hardware.
;
; Function:
;   Attempt to boot from memory card the first time PS2 is executed
;   Apply fixes and hooks to OSDSYS for the PS1, PS2 and DVD disc bootstraps.
;

TARGET BIN

INCLUDE "COMMON.S"

; This is the device the firmware will load BootManager from, if installed.
; Device
;   0 = Memory Card Slot 1 (COMPLETE)
;   1 = Memory Card Slot 2 (COMPLETE)
;   2 = NOT YET WORKING DESPITE not changing CC CODE USB HDD(requires USBD.IRX and USB_MASS.IRX to be stored at mc0:/BM/SHARED) BROKEN USING El Isras BDM Assault: USBD.IRX and USBHDFSD.IRX
;   3 = CC2.0+ DataFlash(on-chip) (COMPLETE)
;   9 = EXPERIMENTAL Internal HDD, requires PS2HDD.IRX, PS2FS.IRX, HDDMOUNT.IRX installed to mc0:/BM/SHARED. Uses __common partition
;
;BOOT_DEV                EQU 0

CPU_TYPE                EQU 1
PAYLOAD_ADDR EQU 0x000E0000

_F_CC_MultiOutCmd       EQU 1
_F_CC_SRAM_Write        EQU 1
_F_CC_BIOS_SetPatchCtrl EQU 1
_F_CC_CDVD_SetPatchCtrl EQU 1

code                    SEGMENT     PAYLOAD_ADDR

main                    PROC

                        addiu       sp, sp, -0x10
                        sw          a0, 0x00(sp)
                        sw          a1, 0x04(sp)
                        sw          a2, 0x08(sp)
                        sw          a3, 0x0C(sp)

                        M_DI        t0, at
                        M_KMODE     t0, at

                        lui         t0, 0xA000
                        lw          t1, 0x0040(t0)                      ; t1 = 0 the first time patch occ's
                        li          at, 1
                        sw          at, 0x0040(t0)                      ; set our "var" to 1 for next time we
                                                                        ;   get exec'd
                        M_UMODE     t0, at
                        ei

                        bne         t1, zero, _bootOSD
                        nop

IF BOOT_DEV == 3
                        li          a0, 0
                        li          a1, BIN_IOPLOAD
                        jal         CC_SRAM_Write                       ; write the IOPLOAD patch to CC SRAM
                        li          a2, 3072

                        jal         CC_BIOS_SetPatchCtrl
                        li          a0, (BIOS_IOPBOOT_EN | BIOS_READKEY_EN | BIOS_MM16_EN | BIOS_MCEXEC_EN)
ENDIF
                        la          a0, txtModuleLoad
                        la          a1, argc_boot
                        lw          a1, 0(a1)
                        la          a2, args_boot
                        li          v1, 6                               ; LoadExecPS2("moduleload", argc_boot, &args_boot);
                        syscall

_bootOSD:
                        sltiu       at, a2, 3
                        bnez        at, _noError
                        nop

                        lw          a0, 0x08(a3)
                        la          a1, txtBM_ELF
                        jal         strcmp
                        nop

                        bnez        v0, _noError
                        nop

                        li          at, 1
                        sw          at, 0x08(sp)

_noError:

                        jal         ScanAndPatchOSD
                        nop

_done:

                        li          a0, 0
                        li          v1, 100
                        syscall                                         ; FlushCache(0);

                        li          a0, 2
                        li          v1, 100
                        syscall                                         ; FlushCache(2);

                        lw          a0, 0x00(sp)
                        lw          a1, 0x04(sp)
                        lw          a2, 0x08(sp)
                        lw          a3, 0x0C(sp)
                        addiu       sp, sp, 0x10
                        li          v1, 7                               ; ExecPS2
                        syscall

main                    ENDP

ScanAndPatchOSD         PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)

                        li          t0, 0x00202DFC                      ; hack for v14 consoles
                        lw          t1, 0(t0)
                        li          at, 0x0C083D58
                        bne         t1, at, _not_v14
                        nop

                        sw          zero, 0(t0)

                        la          t0, isV14
                        li          at, 1
                        sw          at, 0(t0)

                        li          t0, 0x00200000
                        li          t1, 0x00208000

; 0E 00 84 24 0A 00 40 10
                        li          t2, 0x2484000E
                        li          t3, 0x1040000A
_reg_check1:
                        beq         t0, t1, _reg_done
                        nop

                        lw          at, 0x00(t0)
                        bnel        at, t2, _reg_check1
                        addiu       t0, t0, 4

                        lw          at, 0x04(t0)
                        bnel        at, t3, _reg_check1
                        addiu       t0, t0, 4

                        lw          at, -0x04(t0)
                        la          t1, GetRegion_SCEx._jumpPatch
                        sw          at, 0x00(t1)

_reg_done:

_not_v14:
                        li          v0, 0x00201800

; 2D 20 80 02 2D 28 00 00
                        li          t0, 0x0280202D                      ; "daddu   a0, s4, zero"
_l1:                                                                    ; locate DVD hook in bootPS2
                        lw          at, 0x00(v0)
                        bnel        at, t0, _l1
                        addiu       v0, v0, 4

                        lw          at, 0x04(v0)                        ; 2D 28 00 00
                        xori        at, at, 0x282D                      ; "daddu   a1, zero, zero"
                        bnel        at, zero, _l1
                        addiu       v0, v0, 4

                        addiu       s4, v0, -8                          ; s4 = pointer to DVD boot hook

                        li          t0, 0x16110000
                        li          t1, 0x1FFFFFF0
_l2:                                                                    ; locate PS1 hook in bootPS2
                        lw          at, 0x00(v0)
                        and         at, at, t1
                        bnel        at, t0, _l2
                        addiu       v0, v0, 4

                        addiu       s5, v0, 8

                        lw          t1, 0x0000(s4)                      ; t1 = "JAL panic"
                        sll         t0, t1, 6
                        srl         t0, t0, 4                           ; t0 = address of panic

                        li          at, 0x03E00008                      ; force panic to just return.
                        sw          at, 0x0000(t0)
                        sw          zero, 0x0004(t0)

                        li          t2, 0xFBFFFFFF
                        and         t1, t1, t2                          ; Locate "J/JAL panic" inside the "getlinebuf" func
_fixCnfLoop:                                                            ; ok v1-v14?
                        lw          at, 0x00(t0)
                        and         at, at, t2
                        bnel        at, t1, _fixCnfLoop
                        addiu       t0, t0, 4

                        sw          zero, 0x00(t0)                      ; NOP out jump to panic.
                        sw          zero, 0x04(t0)                      ; NOP out delay of jump to panic.

                        li          t1, 0x0080102D                      ; daddu v0, a0, zero

                        lw          at, 0x0C(t0)
                        bnel        at, t1, _l3                         ; v1/v2 only need the NOP
                        sw          t1, 0x08(t0)                        ; make it return "pos" instead of 0

_l3:                                                                    ; locate "sw s0/s1, 0x00(sp)"
                        lhu         at, 0x00(v0)
                        bnel        at, zero, _l3
                        addiu       v0, v0, 4

                        lhu         at, 0x02(v0)
                        andi        at, at, 0xFFFE
                        xori        at, at, 0xAFB0
                        bnel        at, zero, _l3
                        addiu       v0, v0, 4

                        li          at, ((0x08000000) | (((Boot_PS2) << 4) >> 6))
                        sw          at, 0x0C(v0)                        ; Hook the JAL LoadExecPS2 at end of bootPS2

                        li          t0, 0x27BDFF00
                        li          s1, 0xFFFFFF00
_l4:                                                                    ; locate bootPS1 function
                        lw          at, 0x0000(v0)
                        and         at, at, s1
                        bnel        at, t0, _l4
                        addiu       v0, v0, 4

                        li          t1, 0x08000000
                        srl         at, v0, 2
                        or          at, at, t1                          ; at = "J bootPS1"
                        sw          at, 0x0000(s5)                      ; hook the failure to locate "BOOT2" in
                                                                        ; "SYSTEM.CNF" to jump to bootPS1

                        li          t1, 0x03A0302D                      ; daddu   a2, sp, zero
_l5:
                        lw          at, 0x0000(v0)
                        bnel        at, t1, _l5
                        addiu       v0, v0, 4

                        lw          t2, -0x04(v0)                       ; t2 = JAL LoadExecPS2

                        li          at, ((0x08000000) | (((Boot_PS1) << 4) >> 6))
                        sw          at, -0x04(v0)

                        addiu       v0, v0, 0x10

_l6:                                                                    ; locate bootDVDV bootstrap.
                        lw          at, 0x0000(v0)
                        and         at, at, s1
                        bnel        at, t0, _l6
                        addiu       v0, v0, 4

                        li          t0, 0x08000000
                        srl         at, v0, 2
                        or          at, at, t0                          ; at = "J bootDVDV"
                        sw          at, 0x0000(s4)                      ; hook failure to open "SYSTEM.CNF" on the
                                                                        ;   disc to jump to bootDVDV

                        li          t1, ((0x08000000) | (((Boot_DVDV) << 4) >> 6))
                        li          t0, 0x27BD0000
_l7:                                                                    ; locate all occurences of
                                                                        ;   "JAL LoadExecPS2" inside bootDVDV
                        lw          v1, 0x0000(v0)
                        addiu       v0, v0, 4
                        beql        v1, t2, _l7
                        sw          t1, -0x0004(v0)                     ; patch with "J Hook_DVDV"

                        and         at, v1, s1                          ; loop until we match
                        bne         at, t0, _l7                         ;   "addiu sp, sp, 0x00??"
                        nop

_done:

                        lw          ra, 0x00(sp)
                        jr          ra
                        addiu       sp, sp, 0x10

ScanAndPatchOSD         ENDP


;
; Determine the console SCEx region
;

GetRegion_SCEx          PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)

                        li          v0, 0
_jumpPatch:
                        nop                                             ; gets replaced with JAL GetConsoleRegion in v14 consoles
                        addiu       a0, sp, 0x04

                        beqz        v0, _fromBIOS
                        nop

                        lbu         t0, 0x04(sp)

                        li          at, 0x55                            ; 'U'
                        beq         t0, at, _done
                        li          v0, CDVD_SCEA

                        li          at, 0x45                            ; 'E'
                        beq         t0, at, _done
                        li          v0, CDVD_SCEE

                        bu          _done
                        li          v0, CDVD_SCEI

_fromBIOS:

                        lui         v1, 0x1FC8
                        lbu         v1, 0xFF52(v1)

                        li          v0, CDVD_SCEI

                        li          at, 0x41                            ; 'A'
                        beql        v1, at, _done
                        li          v0, CDVD_SCEA

                        li          at, 0x45                            ; 'E'
                        beql        v1, at, _done
                        li          v0, CDVD_SCEE

_done:
                        lw          ra, 0x00(sp)
                        jr          ra
                        addiu       sp, sp, 0x10

GetRegion_SCEx          ENDP

; PS2 disc bootstrap hook.
;
; Params:
;   a0 - char *fname (eg: "rom0:PS2LOGO")
;   a1 - int number of args.
;   a2 - char ** to char *args[1] = { "cdrom0:\PS2.ELF;1" } or whatever the disc's main ELF is named with path.
;

Boot_PS2                PROC

                        or          s0, zero, a0
                        or          s1, zero, a1
                        or          s2, zero, a2

                        jal         CC_CDVD_SetPatchCtrl
                        li          a0, 0

;                        li          a0, txtPS2ELF
;                        jal         strstr
;                        lw          a1, 0x00(s2)
;                        beqz        v0, _done
;                        nop

                        jal         CC_CDVD_SetPatchCtrl
                        li          a0, (CDVD_MECHA_EN | CDVD_BT_EN | (0x07 << 4))

_done:

                        lw          a0, 0x00(s2)                        ; fname = args[0];
                        li          a1, 0
                        li          a2, 0
                        li          v1, 6                               ; LoadExecPS2(fname, 0, 0);
                        syscall

Boot_PS2                ENDP

;
; PS1 disc bootstrap hook.
;
; Params:
;   a0 - char * to "rom0:PS1DRV"
;   a1 - int number of args.
;   a2 - char ** to char *args[1] = { "PSX.EXE" } or whatever the disc's main PSX EXE is named, without path.
;

Boot_PS1                PROC

                        or          s0, zero, a0
                        or          s1, zero, a1
                        or          s2, zero, a2

                        jal         CC_BIOS_SetPatchCtrl
                        li          a0, (BIOS_LOGO_EN | BIOS_MM16_EN)

                        la          t0, isV14
                        lw          t0, 0x00(t0)
                        bnez        t0, _v14
                        li          a0, 0x0000

                        la          a1, BIN_ps1logo
                        bu          _cont
                        li          a2, BIN_ps1logo._size

_v14:
                        la          a1, BIN_ps1logo2
                        li          a2, BIN_ps1logo2._size

_cont:
                        jal         CC_SRAM_Write
                        nop

                        M_DI        t0, t1

_start:
                        jal         CC_CDVD_SetPatchCtrl                      ; It is necessary to first disable all disc
                        li          a0, 0                               ;   auth to cause re-generation of SCEx
                                                                        ;   when it gets re-enabled.

;                        li          a0, txtPSXEXE
;                        jal         strstr
;                        lw          a1, 0x00(s2)
;                        beqz        v0, _noAuth
;                        nop

                        jal         GetRegion_SCEx
                        nop

                        jal         CC_CDVD_SetPatchCtrl                      ; Set PS1 auth generation along with
                        ori         a0, v0, CDVD_SCEX_EN                ;   region.

_noAuth:
                        jal         CycleTray
                        nop

_waitPS1:
                        lui         v0, 0x1F40
                        lbu         v0, 0x200F(v0)

                        sltiu       at, v0, 0x10
                        bnez        at, _waitPS1                        ; wait for DiscType to be >= 0x10

                        sltiu       at, v0, 0x12
                        beq         at, zero, _start                    ; start over if DiscType > 0x11
                        nop

                        ei

                        or          a0, zero, s0
                        or          a1, zero, s1
                        or          a2, zero, s2
                        li          v1, 6                               ; LoadExecPS2
                        syscall

Boot_PS1                ENDP

; DVD Video disc bootstrap hook.
;
; Params:
;   a0 - char * to filename to execute.
;   a1 - int number of args.
;   a2 - char ** to args.
;

Boot_DVDV               PROC

IF DVDV_CYCLE_TRAY
                        or          s0, zero, a0
                        or          s1, zero, a1
                        or          s2, zero, a2

                        M_DI        t0, t1

                        jal         CC_CDVD_SetPatchCtrl                      ; disable all disc auth
                        li          a0, 0

                        jal         CycleTray
                        nop

_l1:
                        lui         v0, 0x1F40
                        lbu         v0, 0x200F(v0)
                        xori        v0, v0, 0xFE
                        bnez        v0, _l1
                        nop

                        ei

                        or          a0, zero, s0
                        or          a1, zero, s1
                        or          a2, zero, s2
ENDIF

                        li          v1, 6                               ; LoadExecPs2
                        syscall

Boot_DVDV               ENDP

; Send a "Tray Open" command followed closely by a "Tray Close" command, causing the CD/DVD hardware to reset
;   and re-check the disc authentication without actually physically ejecting the tray.
CycleTray               PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)

                        lui         s0, 0x1F40

_l1:
                        jal         usleep                              ; It's important to delay, otherwise
                        li          a0, MECHA_DELAY                     ;   the mecha can crash.

                        jal         CdTrayReq                           ; send a "tray open" command.
                        li          a0, 0

                        bnez        v0, _l1                             ; retry if cmd fails(mecha busy)
                        nop

                        jal         usleep
                        li          a0, MECHA_DELAY

                        lbu         at, 0x200A(s0)
                        andi        at, at, 1
                        beqz        at, _l1                             ; Wait for tray to be "open".
                        nop

_l2:
                        jal         usleep
                        li          a0, MECHA_DELAY

                        jal         CdTrayReq                             ; send a "tray close" command.
                        li          a0, 1

                        bnez        v0, _l2
                        nop

                        jal         usleep
                        li          a0, MECHA_DELAY

                        lbu         at, 0x200A(s0)
                        andi        at, at, 1
                        bnez        at, _l2                             ; Wait for tray to be closed.
                        nop

                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        jr          ra
                        addiu       sp, sp, 0x10

CycleTray               ENDP


; Send a "TrayRequest" to the CDVD drive
;
; args: a0 - 0 = open, 1 = close
;

CdTrayReq               PROC

                        lui         t0, 0x1F40

                        lbu         at, 0x2017(t0)
                        andi        at, at, 0x80
                        bnez        at, _done
                        addiu       v0, zero, -1

_l1:
                        lbu         at, 0x2017(t0)
                        andi        at, at, 0x40
                        bnel        at, zero, _l1
                        lbu         zero, 0x2018(t0)

                        sb          a0, 0x2017(t0)                      ; param

                        li          at, 0x06                            ; Tray Request
                        sb          at, 0x2016(t0)                      ; cmd
                        lbu         zero, 0x2016(t0)

_l2:
                        lbu         at, 0x2017(t0)
                        andi        at, at, 0x80
                        bnez        at, _l2
                        nop

_l3:
                        lbu         at, 0x2017(t0)
                        andi        at, at, 0x40
                        beql        at, zero, _l3
                        lbu         zero, 0x2018(t0)

                        li          v0, 0
_done:
                        jr          ra
                        nop

CdTrayReq               ENDP


strcmp                  PROC

_l1:
                        lbu         v0, 0(a0)
                        lbu         v1, 0(a1)
                        bne         v0, v1, _done
                        li          v0, -1

                        addiu       a0, a0, 1
                        bnez        v1, _l1
                        addiu       a1, a1, 1

                        li          v0, 0
_done:
                        jr          ra
                        nop

strcmp                  ENDP

strstr                  PROC

_l1:
                        or          t0, zero, a0                        ; t_str = "str" starting point;
                        or          t1, zero, a1                        ; t_in = "in" starting point;
_l2:
                        lbu         t2, 0x00(t0)
                        beqz        t2, _done                           ; success if we made it to NULL term of "str".
                        or          v0, zero, a1                        ; return ptr to matched string.

                        addiu       t0, t0, 1                           ; t_str++;

                        lbu         t3, 0x00(t1)
                        beqz        t3, _done                           ; fail if we made it to NULL term of "in".
                        li          v0, 0

                        ori         t2, t2, 0x20                        ; make it lower-case
                        ori         t3, t3, 0x20                        ; make it lower-case

                        bnel        t2, t3, _l1                         ; restart the compare and increment the "in"
                        addiu       a1, a1, 1                           ; starting point.

                        bu          _l2                                 ; keep it looping
                        addiu       t1, t1, 1                           ; t_in++;

_done:
                        jr          ra
                        nop

strstr                  ENDP

INCLUDE "CCHW.S"

BIN_ps1logo             PROC
INCLUDE BINARY "..\TMP\PS1LOGO.BIN"
BIN_ps1logo             ENDP
ALIGN 4

BIN_ps1logo2            PROC
INCLUDE BINARY "..\TMP\PS1LOGO2.BIN"
BIN_ps1logo2            ENDP
ALIGN 4

isV14:                  DW  0

args_boot:
IF BOOT_DEV == 0
MESSAGE "Booting from Memory Card Slot 1"
ALIGN 4
                        DW txtROM0_XSIO2MAN, txtROM0_XMCMAN, txtBM_ELF
argc_boot:              DW 3
txtBM_ELF:              DB "mc0:/BM/BM2.ELF",0
ENDIF

IF BOOT_DEV == 1
MESSAGE "Booting from Memory Card Slot 2"
ALIGN 4
                        DW txtROM0_XSIO2MAN, txtROM0_XMCMAN, txtBM_ELF
argc_boot:              DW 3
txtBM_ELF:              DB "mc1:/BM/BM2.ELF",0
ENDIF

IF BOOT_DEV == 2
MESSAGE "Booting from USB"
ALIGN 4
                        DW txtROM0_XSIO2MAN, txtROM0_XMCMAN, txtMC0_USBD, txtMC0_USBHDFSD, txtBM_ELF
argc_boot:              DW 5
txtBM_ELF:              DB "mass:/BM/BM2.ELF",0
txtMC0_USBD:            DB "-m mc0:/BM/SHARED/USBD.IRX",0
txtMC0_USBHDFSD:        DB "-m mc0:/BM/SHARED/USBHDFSD.IRX",0
ENDIF

IF BOOT_DEV == 3
MESSAGE "Booting from CC2.0+ DataFlash"
ALIGN 4
                        DW txtBM_ELF
argc_boot:              DW 1
txtBM_ELF:              DB "dffs:/BM/BM2.ELF",0
BIN_IOPLOAD:            INCLUDE BINARY "..\TMP\IOPLOAD.BIN"
ENDIF

IF BOOT_DEV == 9
MESSAGE "Booting from iHDD"
ALIGN 4
                        DW txtROM0_XSIO2MAN, txtROM0_XMCMAN, txtMC0_IOMANX, txtMC0_PS2DEV9, txtMC0_PS2ATAD, txtMC0_PS2HDD, txtMC0_PS2FS, txtMC0_HDDMOUNT
argc_boot:              DW 8
txtBM_ELF:              DB "pfs0:/BM/BM2.ELF",0
txtMC0_IOMANX:          DB "-m mc0:/BM/SHARED/IOMANX.IRX",0
txtMC0_PS2DEV9:         DB "-m mc0:/BM/SHARED/PS2DEV9.IRX",0
txtMC0_PS2ATAD:         DB "-m mc0/BM/SHARED/PS2ATAD.IRX",0
txtMC0_PS2HDD:          DB "-m mc0/BM/SHARED/PS2HDD.IRX",0
txtMC0_PS2FS:           DB "-m mc0/BM/SHARED/PS2FS.IRX",0
txtMC0_HDDMOUNT:        DB "-m mc0/BM/SHARED/HDDMOUNT.IRX",0
ENDIF

txtModuleLoad:          DB "moduleload",0
txtROM0_XSIO2MAN:       DB "-m rom0:XSIO2MAN",0
txtROM0_XMCMAN:         DB "-m rom0:XMCMAN",0

txtPS2ELF:              DB "PS2.ELF",0
txtPSXEXE:              DB "PSX.EXE",0

ALIGN 4

code                    ENDS
