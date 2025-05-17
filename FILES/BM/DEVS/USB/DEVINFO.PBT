# Crystal Chips BootManager USB HDD driver script. v1.3

KEEP

SET "TITLE" "USB"

# Do not change this.
GOTO "$ARG1$"
RETURN -1

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_USB_DESC_1$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    RETURN 0

:IF_QUERY    
    IF EXISTS "mass:/"
        IF NOT MATCHES "mass:/*"  "$ARG6$"
            ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_USB_DESC$" $ARG2$ "mass" "$ARG3$" "$ARG4$" "$ARG5$"
        ELSEIF MATCHES "mass:/*"  "$ARG6$"
            ADDWIDGET LABEL "$TITLE$-$BM.TXT_NO_INSTALL$"
        ENDIF
    ENDIF
    RETURN 0

:CHECK_PRESENT
    RETURN 0

    IF EXISTS "mass:/"
        IF NEQ "$BM.MASS_PRESENT$" "1"
            LOADEXEC "PBAT" "$BM.SCRIPTS$/BMCONT.PBT" "CHECK" "mass"
            SET "BM.MASS_PRESENT" "1"
        ENDIF
    ELSEIF EQU "$BM.MASS_PRESENT$" "1"
        SET "BM.MASS_PRESENT" "0"
    ENDIF
    RETURN 0

:CHECK
    IF MATCHES "mass:*" "$ARG2$"
        SET "$ARG3$" "$ARG0$"
    ENDIF

    RETURN 0

:INSTALL
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/DEVS/USB"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/DEVS/USB"
        RETURN -1
    ENDIF
    IF FAIL COPY "$SRC_DEV$:/BM/SHARED/USBD.IRX" "$ARG2$:/BM/SHARED/USBD.IRX"
        MESSAGE "Failed installing USBD.IRX!"
        RRM "$ARG2$:/BM/SHARED/USBD.IRX"
        RETURN -1
    ENDIF
    IF FAIL COPY "$SRC_DEV$:/BM/SHARED/USBHDFSD.IRX" "$ARG2$:/BM/SHARED/USBHDFSD.IRX"
        MESSAGE "Failed installing USBHDFSD.IRX!"
        RRM "$ARG2$:/BM/SHARED/USBHDFSD.IRX"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ENDIF
    IF FAIL RRM "$SRC_DEV$:/BM/SHARED/USBD.IRX"
        MESSAGE "Failed removing USBD.IRX!"
        RETURN -1
    ENDIF
    IF FAIL RRM "$SRC_DEV$:/BM/SHARED/USBHDFSD.IRX"
        MESSAGE "Failed removing USBHDFSD.IRX!"
        RETURN -1
    ENDIF
    EXIT 0

:LOAD
    IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/USBD.IRX"
        RETURN -1
    ELSEIF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/USBHDFSD.IRX"
        RETURN -1
    ENDIF

    RETURN 0

:LOADEXEC
    LOADEXEC "EEELF" "moduleload" $BM.DRIVER_DEV_DRIVERS$ "-m $BM.DRIVER_PATH$/USBD.IRX" "-m $BM.DRIVER_PATH$/USBHDFSD.IRX" "$ARG2$" $ARG3$
    EXIT 0