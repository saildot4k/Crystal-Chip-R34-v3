# Crystal Chips BootManager Host driver script. v1.2

KEEP

SET "TITLE" "PC Host"

# Do not change this.
GOTO "$ARG1$"
RETURN -1

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_HOST_DESC_1$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    RETURN 0

:IF_QUERY
    IF EXISTS "host:/"
        IF MATCHES "host:/*"  "$ARG6$"
            ADDWIDGET LABEL "$TITLE$-$BM.TXT_NO_INSTALL$"
            RETURN 0
        ELSEIF MATCHES "RUN" "$ARG7$"
            ADDWIDGET LABEL "$TITLE$-$BM.TXT_RUN_UNAVAIL$"
            RETURN 0
        ELSEIF NOT MATCHES "host:/*"  "$ARG6$"
            ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_HOST_DESC$" $ARG2$ "host" "$ARG3$" "$ARG4$" "$ARG5$"
            RETURN 0
        ENDIF
    ENDIF
    RETURN 0

:CHECK_PRESENT
    RETURN 0

    IF EXISTS "host:/"
        IF NEQ "$BM.HOST_PRESENT$" "1"
            LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "CHECK" "host"
            SET "BM.HOST_PRESENT" "1"
        ENDIF
    ELSEIF EQU "$BM.HOST_PRESENT$" "1"
        SET "BM.HOST_PRESENT" "0"
    ENDIF
    RETURN 0

:CHECK
    # LoadExec on host is not possible at this time so check doesn't need to do anything.
    RETURN 0

:INSTALL
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/DEVS/HOST"
        MESSAGE "Failed installing $TITLE$!"
       RRM "$ARG2$:/BM/DEVS/HOST"
        RETURN -1
    ENDIF
    IF FAIL COPY "$SRC_DEV$:/BM/SHARED/PS2HOST.IRX" "$ARG2$:/BM/SHARED/PS2HOST.IRX"
        MESSAGE "Failed installing PS2HOST.IRX!"
       RRM "$ARG2$:/BM/SHARED/PS2HOST.IRX"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ENDIF
    IF FAIL RRM "$SRC_DEV$:/BM/SHARED/PS2HOST.IRX"
        MESSAGE "Failed removing PS2HOST.IRX!"
        RETURN -1
    ENDIF
    EXIT 0

:LOAD
    RETURN 0

:LOADEXEC
    # LoadExec on host is not possible at this time.
    RETURN "0"
