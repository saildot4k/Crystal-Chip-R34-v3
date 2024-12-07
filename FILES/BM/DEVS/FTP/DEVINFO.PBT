#
# Crystal Chips BootManager Host driver script. v1.2
#

KEEP

SET "TITLE" "FTP"

# Do not change this.
GOTO "$ARG1$"
RETURN "-1"

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_FTP_DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    RETURN "0"

:IF_QUERY
    RETURN "0"

:CHECK_PRESENT
    RETURN 0

:CHECK
    RETURN 0

:INSTALL
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/DEVS/FTP"
        MESSAGE "Failed installing $TITLE$!"
       RRM "$ARG2$:/BM/DEVS/FTP"
        RETURN -1
    ENDIF
    IF FAIL COPY "$SRC_DEV$:/BM/SHARED/PS2FTPD.IRX" "$ARG2$:/BM/SHARED/PS2FTPD.IRX"
        MESSAGE "Failed installing PS2FTPD.IRX!"
       RRM "$ARG2$:/BM/SHARED/PS2FTPD.IRX"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ENDIF
    IF FAIL RRM "$SRC_DEV$:/BM/SHARED/PS2FTPD.IRX"
        MESSAGE "Failed removing PS2FTPD.IRX!"
        RETURN -1
    ENDIF
    EXIT "0"

:LOAD
    RETURN 0

:LOADEXEC
    RETURN "0"
