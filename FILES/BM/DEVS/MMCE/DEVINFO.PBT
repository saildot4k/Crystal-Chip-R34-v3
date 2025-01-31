#
# Crystal Chips BootManager MMCE (MultiPurpose Memory Card Emulator) driver script. v1.0
#

KEEP

SET "TITLE" "MMCE SD Card"

# Do not change this.
GOTO "$ARG1$"
RETURN "-1"

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_MMCE_DESC_1$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    RETURN "0"

:IF_QUERY
    IF EXISTS "mmce0:/"
        ADDWIDGET "CALL" "$TITLE$ 1" "$BM.TXT_MMCE_DESC$ 1" $ARG2$ "mmce0" "$ARG3$" "$ARG4$" "$ARG5$"
    ENDIF
    IF EXISTS "mmce1:/"
        ADDWIDGET "CALL" "$TITLE$ 2" "$BM.TXT_MMCE_DESC$ 2" $ARG2$ "mmce1" "$ARG3$" "$ARG4$" "$ARG5$"
    ENDIF
    RETURN "0"


:CHECK_PRESENT
    RETURN 0

    IF EXISTS "mmce0:/"
        IF NEQ "$BM.MMCE0_PRESENT$" "1"
            LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "CHECK" "mmce0"
            SET "BM.MMCE0_PRESENT" "1"
        ENDIF
    ELSEIF EQU "$BM.MMCE0_PRESENT$" "1"
        SET "BM.MMCE0_PRESENT" "0"
    ENDIF

    IF EXISTS "mmce1:/"
        IF NEQ "$BM.MMCE1_PRESENT$" "1"
            LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "CHECK" "mmce1"
            SET "BM.MMCE1_PRESENT" "1"
        ENDIF
    ELSEIF EQU "$BM.MMCE1_PRESENT$" "1"
        SET "BM.MMCE1_PRESENT" "0"
    ENDIF
    
    RETURN 0

:CHECK
    IF MATCHES "mmce?:*" "$ARG2$"
        SET "$ARG3$" "$ARG0$"
    ENDIF

    RETURN 0

:INSTALL
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/DEVS/MMCE"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/DEVS/MMCE"
        RETURN -1
    ENDIF
    IF FAIL COPY "$SRC_DEV$:/BM/SHARED/MMCEMAN.IRX" "$ARG2$:/BM/SHARED/MMCEMAN.IRX"
        MESSAGE "Failed installing MMCEMAN.IRX!"
        RRM "$ARG2$:/BM/SHARED/MMCEMAN.IRX"
        RETURN -1
    ENDIF
    IF FAIL COPY "$SRC_DEV$:/BM/SHARED/FILEXIO.IRX" "$ARG2$:/BM/SHARED/FILEXIO.IRX"
        MESSAGE "Failed installing FILEXIO.IRX!"
        RRM "$ARG2$:/BM/SHARED/FILEXIO.IRX"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ENDIF
    IF FAIL RRM "$SRC_DEV$:/BM/SHARED/MMCEMAN.IRX"
        MESSAGE "Failed removing MMCEMAN.IRX!"
        RETURN -1
    ENDIF
    IF FAIL RRM "$SRC_DEV$:/BM/SHARED/FILEXIO.IRX"
        MESSAGE "Failed removing FILEXIO.IRX!"
        RETURN -1
    ENDIF
    EXIT "0"

:LOAD
    IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/FILEXIO.IRX"
        RETURN -1
    ENDIF
    IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/MMCEMAN.IRX"
        RETURN -1
    ENDIF

    RETURN 0

:LOADEXEC
    LOADEXEC "EEELF" "moduleload" $BM.DRIVER_DEV_DRIVERS$ "-m $BM.DRIVER_PATH$/IOMANX.IRX" "-m $BM.DRIVER_PATH$/FILEXIO.IRX" "-m $BM.DRIVER_PATH$/MMCEMAN.IRX" "$ARG2$" $ARG3$
    EXIT "0"