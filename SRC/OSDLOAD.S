;
; CrystalChip OSDSYS Patch Loader application v0.01 (c) 2007 Crystal Chips http://www.crystal-chips.com/
;
; ! DO NOT ! exceed or change MAX_PATCH_SIZE!  This is automatically checked at the end of this file,
;   watch for it!
;
; This patch gets applied to rom0:OSDSYS when it's loaded from the BIOS.
;
; Function:
;   This patch will read OSDHOOK.BIN from EEPROM/Flash to EE RAM, unpack it using the UCL N2E algorithm and
;       execute it.
;   See OSDHOOK.S for more details on the function of OSDHOOK.BIN.
;

TARGET BIN
MAX_PATCH_SIZE          EQU 0x62C
INCLUDE "COMMON.S"

CPU_TYPE EQU 1
PAYLOAD_ADDR EQU 0x000E0000

IF CC_USE_EEP
_F_CC_MultiInCmd        EQU 1
_F_CC_EEP_Read          EQU 1
ELSE
_F_CC_DF_Detect         EQU 1
_F_CC_BurstExtraIn      EQU 1
_F_CC_SPI_ExchangeByte  EQU 1
_F_CC_DF_SendCmd        EQU 1
_F_CC_SPI_TransferBurstIn      EQU 1
_F_CC_DF_ReadStatus     EQU 1
_F_CC_DF_Read           EQU 1
ENDIF

IF CC_FORMAT_10
CCFW_HEADER_SIZE        EQU 5
ELSE
CCFW_HEADER_SIZE        EQU 7
ENDIF

code                    SEGMENT 0x001001B4

_load_start:
                        bu          osd_main
                        nop

fwfs_index:

                        DB          "OSDP"
                        DW          1                                   ; packed
                        DW          FWFS_FileOSDP_Start - _load_start + CCFW_HEADER_SIZE
                        DW          (FWFS_FileOSDP_End - FWFS_FileOSDP_Start)

IF BOOT_DEV == 3
                        DB          "IOPM"
                        DW          1                                   ; packed
                        DW          FWFS_FileIOPM_Start - _load_start + CCFW_HEADER_SIZE
                        DW          (FWFS_FileIOPM_End - FWFS_FileIOPM_Start)
ELSE
                        DB          16 DUP(0)
ENDIF
;                        DB          16 DUP(0)
;                        DB          16 DUP(0)

osd_main                PROC

IF 0
                        addiu       sp, sp, -0x20
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)
                        sw          s2, 0x0c(sp)
                        sw          s3, 0x10(sp)
ENDIF

                        or          s0, zero, a0
                        or          s1, zero, a1
                        or          s2, zero, a2
                        or          s3, zero, a3

IF CC_USE_EEP == 0
                        jal         CC_DF_Detect
                        nop
ENDIF

                        li          a1, PAYLOAD_ADDR
                        jal         LoadFileFWFS                        ; load OSDPAY.BIN
                        li          a0, 0

                        li          a0, 0
                        li          v1, 100
                        syscall

                        li          a0, 2
                        li          v1, 100
                        syscall

IF 1
                        or          a0, zero, s0
                        or          a1, zero, s1
                        or          a2, zero, s2
                        li          at, PAYLOAD_ADDR
                        jr          at                                  ; Execute the payload
                        or          a3, zero, s3

ELSE
                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        lw          s2, 0x0C(sp)
                        lw          s3, 0x10(sp)
                        jr          ra
                        addiu       sp, sp, 0x20
ENDIF

osd_main                ENDP

INCLUDE "CCHW.S"
INCLUDE "N2E.S"
INCLUDE "FWFS.S"

_load_end:

FWFS_FileOSDP_Start:
INCLUDE BINARY "..\TMP\OSDPAY.N2E"
FWFS_FileOSDP_End:

IF BOOT_DEV == 3
FWFS_FileIOPM_Start:
INCLUDE BINARY "IOPMAN.N2E"
FWFS_FileIOPM_End:
ENDIF

_end:
code                    ENDS

IF (code._load_end - code._load_start) > MAX_PATCH_SIZE
ERROR "!!! Patch size(", (code._load_end - code._load_start), ") exceeds maximum patch size(", MAX_PATCH_SIZE, ")!"
ELSE
MESSAGE "OSDSYS loader size: ", code._load_end - code._load_start
ENDIF

MESSAGE "Total output file size: ", code._size
