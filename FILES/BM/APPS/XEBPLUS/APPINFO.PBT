# BootManager 2 Application Manager Script for XEB+

# Change this information to describe the application.
SET "TITLE" "XEB+"
SET "VERSION" "Christmas Edition"
SET "AUTHOR" "Chelsea Fantasy and Howling Wolf"
SET "DESC" "Dashboard Replacment which only runs from USB."
SET "MEDIAS" ""
#

# Do not change these 2 lines!
GOTO "$ARG1$"
RETURN "-1"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$" 
    EXIT "0"

:INSTALL
    MESSAGE "Due to licenseing, XEB+ must be downloaded yourself."
    EXIT "0"

:REMOVE
    IF FAIL RRM "mass:/XEBPLUS"
        MESSAGE "Failed to remove $TITLE$"
        RETURN -1
    ELSIF FAIL RRM "$PWD$"
        MESSAGE "Failed to remove APPINFO.PBT"
        RETURN -1
    ENDIF

    EXIT "0"

:RUN

    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"
    
    IF NEQ "$SRC_DEV$" "mass"
        MESSAGE "XEB+ only runs from USB!"
        RETURN -1
    ELSEIF EXISTS "$SRC_DEV$:/XEBPLUS/XEBPLUS_XMAS.ELF"
        SHUTDOWN "MM"
        LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$SRC_DEV$:/XEBPLUS/XEBPLUS_XMAS.ELF"
        EXIT 0
    ELSEIF NOT EXISTS "$SRC_DEV$:/XEBPLUS/XEBPLUS_XMAS.ELF"
        MESSAGE "XEB+ is not installed on root of USB!"
        RETURN -1
    ENDIF

    EXIT 0
