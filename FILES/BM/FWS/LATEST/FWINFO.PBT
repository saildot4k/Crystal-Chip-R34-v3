# BootManager 2 Firmware Manager Script for Crystal Chips Firmware
#
# Modification: R3Z3N has modified this to show CC 1.X users firmware options and hide options for CC2.0 users.
#

# Change this information to describe the application.
SET "TITLE" "Crystal Chips Firmware"
SET "VERSION" "Release 34 v3"
SET "AUTHOR" "CrystalChips"
SET "DESC" "Upgrade your CrystalChip to the latest firmware! MC0/MC1 Boot options by R3Z3N for CC1.X"
#

GOTO "$ARG1$"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ $VERSION$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT "0"

:INSTALL
    # CC1.X FW BM run from MC0,MC1 options. USB/HDD currently broken. The latter boots BM.ELF but cannot load scripts. Uncomment the 2 options below to test.
    IF EQU "$BM.CC_MAJOR_VER$" "1"
        SETTITLE "$BM.TXT_FW_TITLE$"
        ADDWIDGET "LABEL" "$BM.TXT_FW_QUESTION$"
        ADDWIDGET "LABEL" ""
        ADDWIDGET "CALL" "$BM.TXT_FW_MC0$" "$BM.TXT_FW_MC0_HINT$" "$ARG0$" "INSTALL_WITH_OPTION" "1"
        ADDWIDGET "CALL" "$BM.TXT_FW_MC1$" "$BM.TXT_FW_MC1_HINT$" "$ARG0$" "INSTALL_WITH_OPTION" "2"
#        ADDWIDGET "CALL" "$BM.TXT_FW_USB$" "$BM.TXT_FW_USB_HINT$" "$ARG0$" "INSTALL_WITH_OPTION" "3"
#        ADDWIDGET "CALL" "$BM.TXT_FW_HDD$" "$BM.TXT_FW_HDD_HINT$" "$ARG0$" "INSTALL_WITH_OPTION" "4"
    # Otherwise installs CC2.0 FW
    ELSE
        IF EQU "$BM.CC_MAJOR_VER$" "2"
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
    ENDIF

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

                EXIT "0"
            BREAK

        CASE 3
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
                EXIT "0"
            BREAK

        CASE 4
        #FW w/ BM on iHDD, iHDD Drivers must be installed to MC0
            IF EQU "$BM.CC_MAJOR_VER$" "1"
                IF EQU "$BM.CC_MINOR_VER$" "0"
                    SET TMP "FWARE10DEV9.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "1"
                    SET TMP "FWARE11DEV9.CCI"
                ELSEIF EQU "$BM.CC_MINOR_VER$" "2"
                    SET TMP "FWARE12DEV9.CCI"
                ELSE
                    MESSAGE "$BM.TXT_NO_CC$ CC$BM.CC_MAJOR_VER$.$BM.CC_MINOR_VER$!"
                    EXIT "-1"
                ENDIF
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
                EXIT "0"
            BREAK

:REMOVE
    EXIT "0"

:RUN
    EXIT "0"