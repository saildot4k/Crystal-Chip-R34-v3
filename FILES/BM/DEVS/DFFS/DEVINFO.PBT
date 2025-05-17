# Crystal Chips BootManager CC Flash driver script. v1.1

KEEP

SET "TITLE" "CC Flash"

# Do not change this.
GOTO "$ARG1$"
RETURN -1

:QUERY
    RETURN 0

:IF_QUERY
    IF EXISTS "dffs:/"
        IF NOT MATCHES "dffs:/*"  "$ARG6$"
            ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_CCFLASH_DESC$" $ARG2$ "dffs" "$ARG3$" "$ARG4$" "$ARG5$"
        ELSEIF MATCHES "dffs:/*"  "$ARG6$"
            ADDWIDGET LABEL "$TITLE$-$BM.TXT_NO_INSTALL$"
        ENDIF
    ENDIF
    RETURN 0

:CHECK_PRESENT
    RETURN 0

    IF NEQ "$BM.DFFS_PRESENT$" "1"
        IF EXISTS "dffs:/"
            IF NEQ "$BM.DFFS_PRESENT$" "1"
                LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "CHECK" "dffs"
                SET "BM.DFFS_PRESENT" "1"
            ENDIF
        ELSEIF EQU "$BM.DFFS_PRESENT$" "1"
            SET "BM.DFFS_PRESENT" "0"
        ENDIF
    ENDIF

    RETURN 0

:CHECK
    IF MATCHES "dffs:*" "$ARG2$"
        SET "$ARG3$" "$ARG0$"
    ENDIF

    RETURN 0

:INSTALL
    EXIT 0

:REMOVE
    EXIT 0

:LOAD
    IF EXISTS "dffs:/"
        RETURN 0
    ENDIF

    RETURN -1

:LOADEXEC
    LOADEXEC "EEELF" "$ARG2$" $ARG3$
    EXIT "0"

:SETEXIT
    SETEXIT "moduleload" "$ARG2$" $ARG3$
    EXIT "0"
