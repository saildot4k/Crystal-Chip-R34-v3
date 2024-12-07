# BootManager 2 Firmware Manager Script for Crystal Chips Firmware

# Change this information to describe the application.
SET "TITLE" "Crystal Chips Firmware"
SET "VERSION" "Release 34 v3 BETA"
SET "AUTHOR" "CrystalChips"
SET "DESC" "Upgrade your CrystalChip to the latest firmware! MC0/MC1 Boot options by R3Z3N"
#

GOTO "$ARG1$"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ $VERSION$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT "0"

:INSTALL
    SETTITLE "Firmware Variations:"
    ADDWIDGET "LABEL" "CC1.X: Run BM from which interface?"
    ADDWIDGET "LABEL" "CC2.0: BM always runs from DFFS!"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "1- BM runs from MemCard1, CC2.0 via DFFS" "Install CC FW and runs BM on MemCard1 CC1.0-1.2 ONLY. CC2.0 runs BM from DFFS." "$ARG0$" "INSTALL_WITH_OPTION" "1"
    ADDWIDGET "CALL" "2- BM runs from MemCard2, CC2.0 via DFFS" "Install CC FW and runs BM on MemCard1 CC1.0-1.2 ONLY. CC2.0 runs BM from DFFS." "$ARG0$" "INSTALL_WITH_OPTION" "2"
#    ADDWIDGET "CALL" "3- BM runs from USB, CC2.0 via DFFS" "Install CC FW and runs BM on MemCard1 CC1.0-1.2 ONLY. USB Drivers MUST be installed to MemCard1 via Device Manager. CC2.0 runs BM from DFFS." "$ARG0$" "INSTALL_WITH_OPTION" "0"
    RETURN 0


:INSTALL_WITH_OPTION
    ECHO "$ARG2$"
    SWITCH "$ARG2$"
        CASE 1
        #FW w/ BM on MC0
            IF EQU "$BM.CC_MAJOR_VER$" "1"
                IF EQU "$BM.CC_MINOR_VER$" "0"
                    SET TMP "FWARE10DEV0.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "1"
                    SET TMP "FWARE11DEV0.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "2"
                    SET TMP "FWARE12DEV0.CCI"
                ELSE
                    MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                    EXIT "-1"
                ENDIF
            ELSEIF EQU "$BM.CC_MAJOR_VER$" "2"
                SET TMP "FWARE20.CCI"
            ELSE
                MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                EXIT "-1"
            ENDIF

            IF NOT EXISTS "$PWD$/$TMP$"
                MESSAGE "No CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$-compatible firmware found in this release!"
                EXIT "-1"
            ENDIF

            IF FAIL PROGFW "$PWD$/$TMP$"
                MESSAGE "$BM.TXT_PROGFW_FAIL$"
                EXIT "-1"
            ENDIF

            MESSAGE "$BM.TXT_PROGFW_DONE$"
            MESSAGE "Please install BM to MemCard1!"

                EXIT "0"
            BREAK
        CASE 2
        #FW w/ BM on MC1
            IF EQU "$BM.CC_MAJOR_VER$" "1"
                IF EQU "$BM.CC_MINOR_VER$" "0"
                    SET TMP "FWARE10DEV1.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "1"
                    SET TMP "FWARE11DEV1.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "2"
                    SET TMP "FWARE12DEV1.CCI"
                ELSE
                    MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                    EXIT "-1"
                ENDIF
            ELSEIF EQU "$BM.CC_MAJOR_VER$" "2"
                SET TMP "FWARE20.CCI"
            ELSE
                MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                EXIT "-1"
            ENDIF

            IF NOT EXISTS "$PWD$/$TMP$"
                MESSAGE "No CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$-compatible firmware found in this release!"
                EXIT "-1"
            ENDIF

            IF FAIL PROGFW "$PWD$/$TMP$"
                MESSAGE "$BM.TXT_PROGFW_FAIL$"
                EXIT "-1"
            ENDIF

            MESSAGE "$BM.TXT_PROGFW_DONE$"
            MESSAGE "Please install BM to MemCard2!"

                EXIT "0"
            BREAK
        CASE 0
        #FW w/ BM on USB, USBD Drivers must be installed to MC0
            IF EQU "$BM.CC_MAJOR_VER$" "1"
                IF EQU "$BM.CC_MINOR_VER$" "0"
                    SET TMP "FWARE10DEV2.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "1"
                    SET TMP "FWARE11DEV2.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "2"
                    SET TMP "FWARE12DEV2.CCI"
                ELSE
                    MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                    EXIT "-1"
                ENDIF
            ELSEIF EQU "$BM.CC_MAJOR_VER$" "2"
                SET TMP "FWARE20.CCI"
            ELSE
                MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                EXIT "-1"
            ENDIF

            IF NOT EXISTS "$PWD$/$TMP$"
                MESSAGE "No CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$-compatible firmware found in this release!"
                EXIT "-1"
            ENDIF

            IF FAIL PROGFW "$PWD$/$TMP$"
                MESSAGE "$BM.TXT_PROGFW_FAIL$"
                EXIT "-1"
            ENDIF
              MESSAGE "$BM.TXT_PROGFW_DONE$"
              MESSAGE "Please install BM to USB!"
              MESSAGE "Use Device Manager to install USB Drivers to MemCard1!"
                EXIT "0"
            BREAK


:REMOVE
    EXIT "0"

:RUN
    EXIT "0"
