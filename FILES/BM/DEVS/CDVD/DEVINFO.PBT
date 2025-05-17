# Crystal Chips BootManager CD/DVD driver script. v1.0

KEEP

PEEKB "0x1F40200F" "DISK_TYPE"

SET "TITLE" "CD/DVD"

# Do not change this.
GOTO "$ARG1$"
RETURN -1

:QUERY
    RETURN 0

:IF_QUERY
    IF LT "$DISK_TYPE$" "0x10"
        RETURN 0
    ENDIF
    IF EXISTS "cdrom0:/"
        IF MATCHES "INSTALL MENU_CHOOSE_INST_DEV" "$ARG7$ $ARG8$"
            GOTO "NO_INSTALL_CDROM"
        ELSEIF MATCHES "REMOVE" "$ARG7$"
            GOTO "NO_REMOVE_CDROM"
        ELSEIF NOT MATCHES "cdrom0:/*"  "$ARG6$"
            ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_CDVD_DESC$" $ARG2$ "cdrom0" "$ARG3$" "$ARG4$" "$ARG5$"
        ENDIF
    ENDIF
    RETURN 0

:NO_INSTALL_CDROM
    ADDWIDGET LABEL "$TITLE$-$BM.TXT_NO_INSTALL_CDROM$"
    RETURN 0

:NO_REMOVE_CDROM
    ADDWIDGET LABEL "$TITLE$-$BM.TXT_NO_REMOVE_CDROM$"
    RETURN 0

:CHECK_PRESENT
    IF LT "$DISK_TYPE$" "0x10"
        SET "BM.CDROM_PRESENT" "0"

        IF EQU "$DISK_TYPE$" "0x00"
            SET "BM.DISC_CONTENT" "NONE"
        ENDIF

        RETURN 0
    ENDIF

    IF EXISTS "cdrom0:/"
        IF NEQ "$BM.CDROM_PRESENT$" "1"
            LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "cdrom0"
            SET "BM.CDROM_PRESENT" "1"
        ENDIF
    ELSE
        IF GTE "$DISK_TYPE$" "0x10"
            IF NEQ "$BM.CDROM_PRESENT$" "1"
                LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "cdrom0"
                SET "BM.CDROM_PRESENT" "1"
            ENDIF
        ELSEIF EQU "$BM.CDROM_PRESENT$" "1"
            SET "BM.CDROM_PRESENT" "0"
        ENDIF
    ENDIF
    RETURN 0

:CHECK
    IF MATCHES "cdrom?:*" "$ARG2$"
        SET "$ARG3$" "$ARG0$"
    ELSEIF MATCHES "cdrom:*" "$ARG2$"
        SET "$ARG3$" "$ARG0$"
    ENDIF

    RETURN 0

:INSTALL
    EXIT 0

:REMOVE
    EXIT 0

:LOAD
    # CD/DVD drivers are embedded, no loading is needed...
    RETURN 0

:LOADEXEC
    LOADEXEC "EEELF" "$ARG2$" $ARG3$
    RETURN 0
