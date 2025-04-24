# Crystal Chip BootManager Events Script v1.0
# (c) 2005-2006 Crystal Chips
# http:/www.crystal-chips.com/
#
# This script is called by BootManager when events, such as Button Presses, occur.
#
# Do not modify the menu with ADDWIDGET or SETMENU in this script!

# Keep this script resident in memory to speed up calls to it.
KEEP

GOTO "$ARG1$"

########################################################################
:EVENT_STARTUP

ECHO "Loading disc icons..."
LOADIMG "$BM.BM_PATH$/GFX/ICNPS1.TGA" "DISC_ICN_PS1"
LOADIMG "$BM.BM_PATH$/GFX/ICNPS2.TGA" "DISC_ICN_PS2"
LOADIMG "$BM.BM_PATH$/GFX/ICNVIDEO.TGA" "DISC_ICN_VIDEO"
LOADIMG "$BM.BM_PATH$/GFX/ICNMUSIC.TGA" "DISC_ICN_MUSIC"
LOADIMG "$BM.BM_PATH$/GFX/ICNUNKWN.TGA" "DISC_ICN_UNKNOWN"

ECHO "Loading startup scripts..."
LOADEXEC "PBATS" "$BM.BM_PATH$/STARTUP/*.PBT"

RETURN 0
########################################################################

########################################################################

:EVENT_WIDGET_SUBMIT
# ARG2 = name of the variable associated with the widget that has changed.
# This event callback is called when a widget has been changed and submitted.

#ECHO "Widget Submit: $ARG2$"

IF EQU "BM.CNF_VMODE" "$ARG2$"
    SWITCH "$BM.CNF_VMODE$"
        CASE 1
        # PAL
            SET "BM.CNF_SCREEN_X" "0"
            SET "BM.CNF_SCREEN_Y" "0"
            BREAK
        CASE 2
        # VGA
            SET "BM.CNF_SCREEN_X" "0"
            SET "BM.CNF_SCREEN_Y" "0"
            BREAK
        CASE 2
        # 480P
            SET "BM.CNF_SCREEN_X" "0"
            SET "BM.CNF_SCREEN_Y" "0"
            BREAK
        CASE 0
        DEFAULT
        # NTSC
            SET "BM.CNF_SCREEN_X" "0"
            SET "BM.CNF_SCREEN_Y" "0"
            BREAK
    ENDS

    # Reload the theme script
    LOADEXEC "PBAT" "$BM.LOADED_THEME_SCRIPT$" "UNLOAD"
    LOADEXEC "PBAT" "$BM.CNF_THEME_SCRIPT$" "LOAD"

    # Save the theme variables
    SAVEVARS "BM.THM_CNF_*" "$BM.BM_PATH$/CONFIG/THMCONF.PBT"
    SET "BM.THM_CONF_CHANGED" "0"

ELSEIF MATCHES "BM.CNF_NET*" "$ARG2$"
    SET "BM.NET_CONFIG_CHANGED" "1"
ENDIF

IF MATCHES "BM.CNF_*" "$ARG2$"
    SET "BM.CONFIG_CHANGED" "1"
ELSEIF MATCHES "BM.THM_CNF_*" "$ARG2$"
    SET "BM.THM_CONF_CHANGED" "1"
ENDIF

RETURN 0
########################################################################

########################################################################
:EVENT_MEDIA_CHECK
# This event occurs every 2 seconds

# Call all the device scripts.
LOADEXEC "PBATS" "$BM.BM_PATH$/DEVS/*/DEVINFO.PBT" "CHECK_PRESENT"

RETURN 0
########################################################################

########################################################################
:EVENT_AUTOLOAD
# This event occurs every second, as long as no button has been pressed on
# any PS2 controller since BM has started.

SWITCH "$BM.DISC_CONTENT$"
    CASE "PS1"
        IF NEQ "$BM.CNF_AL_PS1_CMD$" "0"
            IF GTE "$BM.PAD_IDLE_TIME$" "$BM.CNF_AL_PS1_DELAY$"
                LOADEXEC "PBAT" "$BM.CNF_AL_PS1_PBT$" $BM.CNF_AL_PS1_PBT_ARGS$
            ENDIF
        ENDIF
        BREAK
    CASE "PS2"
        IF NEQ "$BM.CNF_AL_PS2_CMD$" "0"
            IF GTE "$BM.PAD_IDLE_TIME$" "$BM.CNF_AL_PS2_DELAY$"
                LOADEXEC "PBAT" "$BM.CNF_AL_PS2_PBT$" $BM.CNF_AL_PS2_PBT_ARGS$
            ENDIF
        ENDIF
        BREAK
    CASE "DVDV"
        IF NEQ "$BM.CNF_AL_DVDV_CMD$" "0"
            IF GTE "$BM.PAD_IDLE_TIME$" "$BM.CNF_AL_DVDV_DELAY$"
                LOADEXEC "PBAT" "$BM.CNF_AL_DVDV_PBT$" $BM.CNF_AL_DVDV_PBT_ARGS$
            ENDIF
        ENDIF
        BREAK
    CASE "CDDA"
        IF NEQ "$BM.CNF_AL_CDDA_CMD$" "0"
            IF GTE "$BM.PAD_IDLE_TIME$" "$BM.CNF_AL_CDDA_DELAY$"
                LOADEXEC "PBAT" "$BM.CNF_AL_CDDA_PBT$" $BM.CNF_AL_CDDA_PBT_ARGS$
            ENDIF
        ENDIF
        BREAK
    CASE "NONE"
        IF NEQ "$BM.CNF_AL_NODISC_CMD$" "0"
            IF GTE "$BM.PAD_IDLE_TIME$" "$BM.CNF_AL_NODISC_DELAY$"
                LOADEXEC "PBAT" "$BM.CNF_AL_NODISC_PBT$" $BM.CNF_AL_NODISC_PBT_ARGS$
            ENDIF
        ENDIF
        BREAK
    DEFAULT
        BREAK
ENDS
