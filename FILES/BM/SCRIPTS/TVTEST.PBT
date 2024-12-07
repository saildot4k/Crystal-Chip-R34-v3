#
# Crystal Chips BootManager TV Test PBAT Script v1.0
#
# (c) 2006 Crystal Chips - http://www.crystal-chips.com/
#
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file is unmodified.  If you modify this script and distribute it,
#   please edit this text.  Please do not change the copyright information.
#
# Description:
#
# This script is used by BootManager(BM) to determine video modes supported by
#   the TV connected to the console and automatically configure video settings.
#

KEEP

GOTO "$ARG1$"

:TEST_VIDEO
    CLEARWIDGETS
    SETTITLE "$BM.TXT_VID_WIZ$"
    SKIPBACK

    ADDWIDGET "LABEL" "$BM.TXT_VID_WIZ_1$"
    ADDWIDGET "LABEL" "$BM.TXT_VID_WIZ_2$"
    ADDWIDGET "LABEL" "$BM.TXT_VID_WIZ_3$"
    ADDWIDGET "LABEL" "$BM.TXT_VID_WIZ_4$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "$BM.TXT_VID_WIZ_START$" "$BM.TXT_HINT_VID_WIZ_START$" "$ARG0$" "TEST_VIDEO_50HZ"
    RETURN 0

:TEST_VIDEO_50HZ
    CLEARWIDGETS
    SETTITLE "$BM.TXT_TEST_50HZ$"
    SKIPBACK

    # Preserve configuration settings
    SET "S32" "BM.BAK_VMODE" "$BM.CNF_VMODE$"
    SET "S32" "BM.BAK_SCREEN_X" "$BM.CNF_SCREEN_X$"
    SET "S32" "BM.BAK_SCREEN_Y" "$BM.CNF_SCREEN_Y$"

    SET "S32" "BM.BAK_PS2_PAL_VFIX_EN" "$BM.CNF_PS2_PAL_VFIX_EN$"
    SET "S32" "BM.BAK_PS2_PAL_MODS_EN" "$BM.CNF_PS2_PAL_MODS_EN$"
    SET "S32" "BM.BAK_PS2_PAL_VSYNC" "$BM.CNF_PS2_PAL_VSYNC$"
    SET "S32" "BM.BAK_PS2_PAL_COLOR" "$BM.CNF_PS2_PAL_COLOR$"

    SET "S32" "BM.BAK_PS2_NTSC_VFIX_EN" "$BM.CNF_PS2_NTSC_VFIX_EN$"
    SET "S32" "BM.BAK_PS2_NTSC_MODS_EN" "$BM.CNF_PS2_NTSC_MODS_EN$"
    SET "S32" "BM.BAK_PS2_NTSC_VSYNC" "$BM.CNF_PS2_NTSC_VSYNC$"
    SET "S32" "BM.BAK_PS2_NTSC_COLOR" "$BM.CNF_PS2_NTSC_COLOR$"

    SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "0"
    SET "S32" "BM.CNF_PS2_PAL_MODS_EN" "0"
    SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "0"
    SET "S32" "BM.CNF_PS2_NTSC_MODS_EN" "0"

    SET "BM.CNF_SCREEN_X" "0"
    SET "BM.CNF_SCREEN_Y" "0"

    # Set the video mode to PAL 50Hz
    SET "BM.CNF_VMODE" "1"
    SETVMODE "$BM.CNF_VMODE$"

    ADDWIDGET "LABEL" "$BM.TXT_CAN_YOU_READ$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "$BM.TXT_NO$" "" "$ARG0$" "TEST_VIDEO_PAL" "NO_50HZ"
    ADDWIDGET "CALL" "$BM.TXT_YES_BUT$" "" "$ARG0$" "TEST_VIDEO_PAL" "NO_50HZ"
    ADDWIDGET "CALL" "$BM.TXT_YES$" "" "$ARG0$" "TEST_VIDEO_PAL"
    RETURN 0

:TEST_VIDEO_PAL
    CLEARWIDGETS
    SETTITLE "$BM.TXT_TEST_PAL$"
    SKIPBACK

    IF EQU "$ARG2$" "NO_50HZ"
        SET "BM.CNF_TV_50HZ" "0"
    ELSE
        SET "BM.CNF_TV_50HZ" "1"
    ENDIF

    IF EQU "$BM.CNF_TV_50HZ$" "0"
        SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "0"

        # Force PAL color
        SET "S32" "BM.CNF_PS2_NTSC_COLOR" "3"

        SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "1"

        # Set the video mode to NTSC 60Hz with PAL color
        SET "BM.CNF_VMODE" "0"

    ELSE
        SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "0"
        SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "0"

        # Set the video mode to PAL 50Hz with PAL color
        SET "BM.CNF_VMODE" "1"
    ENDIF

    SETVMODE "$BM.CNF_VMODE$"

    ADDWIDGET "LABEL" "$BM.TXT_SCREEN_COLOR$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "$BM.TXT_NO$" "" "$ARG0$" "TEST_VIDEO_60HZ" "NO_PAL"
    ADDWIDGET "CALL" "$BM.TXT_YES$" "" "$ARG0$" "TEST_VIDEO_60HZ"
    RETURN 0

:TEST_VIDEO_60HZ
    CLEARWIDGETS
    SETTITLE "$BM.TXT_TEST_60HZ$"
    SKIPBACK

    IF EQU "$ARG2$" "NO_PAL"
        SET "BM.CNF_TV_PAL" "0"
    ELSE
        SET "BM.CNF_TV_PAL" "1"
    ENDIF

    SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "0"

    # Set the video mode to NTSC 60Hz
    SET "BM.CNF_VMODE" "0"
    SETVMODE "$BM.CNF_VMODE$"

    ADDWIDGET "LABEL" "$BM.TXT_CAN_YOU_READ$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "$BM.TXT_NO$" "" "$ARG0$" "TEST_VIDEO_NTSC" "NO_60HZ"
    ADDWIDGET "CALL" "$BM.TXT_YES_BUT$" "" "$ARG0$" "TEST_VIDEO_NTSC" "NO_60HZ"
    ADDWIDGET "CALL" "$BM.TXT_YES$" "" "$ARG0$" "TEST_VIDEO_NTSC"
    RETURN 0

:TEST_VIDEO_NTSC
    CLEARWIDGETS
    SETTITLE "$BM.TXT_TEST_NTSC$"
    SKIPBACK

    IF EQU "$ARG2$" "NO_60HZ"
        SET "BM.CNF_TV_60HZ" "0"
    ELSE
        SET "BM.CNF_TV_60HZ" "1"
    ENDIF

    IF EQU "$BM.CNF_TV_50HZ$" "0"
        SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "0"
        SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "0"

        # Set the video mode to NTSC 60Hz
        SET "BM.CNF_VMODE" "0"

    ELSE
        SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "0"
        SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "1"

        # Force NTSC color
        SET "S32" "BM.CNF_PS2_PAL_COLOR" "2"

        # Set the video mode to PAL 50Hz with NTSC color
        SET "BM.CNF_VMODE" "1"
    ENDIF

    SETVMODE "$BM.CNF_VMODE$"

    ADDWIDGET "LABEL" "$BM.TXT_SCREEN_COLOR$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "$BM.TXT_NO$" "" "$ARG0$" "TEST_VIDEO_DONE" "NO_NTSC"
    ADDWIDGET "CALL" "$BM.TXT_YES$" "" "$ARG0$" "TEST_VIDEO_DONE"
    RETURN 0

:TEST_VIDEO_DONE
    CLEARWIDGETS
SETTITLE "$BM.TXT_TEST_RESULTS$"
    SKIPBACK

    IF EQU "$ARG2$" "NO_NTSC"
        SET "BM.CNF_TV_NTSC" "0"
    ELSE
        SET "BM.CNF_TV_NTSC" "1"
    ENDIF

    # Restore configuration settings
    SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "$BM.BAK_PS2_PAL_VFIX_EN$"
    SET "S32" "BM.CNF_PS2_PAL_MODS_EN" "$BM.BAK_PS2_PAL_MODS_EN$"
    SET "S32" "BM.CNF_PS2_PAL_VSYNC" "$BM.BAK_PS2_PAL_VSYNC$"
    SET "S32" "BM.CNF_PS2_PAL_COLOR" "$BM.BAK_PS2_PAL_COLOR$"

    SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "$BM.BAK_PS2_NTSC_VFIX_EN$"
    SET "S32" "BM.CNF_PS2_NTSC_MODS_EN" "$BM.BAK_PS2_NTSC_MODS_EN$"
    SET "S32" "BM.CNF_PS2_NTSC_VSYNC" "$BM.BAK_PS2_NTSC_VSYNC$"
    SET "S32" "BM.CNF_PS2_NTSC_COLOR" "$BM.BAK_PS2_NTSC_COLOR$"

    SET "S32" "BM.CNF_SCREEN_X" "$BM.BAK_SCREEN_X$"
    SET "S32" "BM.CNF_SCREEN_Y" "$BM.BAK_SCREEN_Y$"
    SET "S32" "BM.CNF_VMODE" "$BM.BAK_VMODE$"

    SETVMODE "$BM.CNF_VMODE$"

    ADDWIDGET "LABEL" "$BM.TXT_TEST_COMPLETE$"
    ADDWIDGET "LABEL" ""

    IF EQU "$BM.CNF_TV_50HZ$" "1"
        ADDWIDGET "LABEL" "$BM.TXT_50HZ_YES$"
    ELSE
        ADDWIDGET "LABEL" "$BM.TXT_50HZ_NO$"
    ENDIF

    IF EQU "$BM.CNF_TV_60HZ$" "1"
        ADDWIDGET "LABEL" "$BM.TXT_60HZ_YES$"
    ELSE
        ADDWIDGET "LABEL" "$BM.TXT_60HZ_NO$"
    ENDIF

    IF EQU "$BM.CNF_TV_PAL$" "1"
        ADDWIDGET "LABEL" "$BM.TXT_PAL_YES$"
    ELSE
        ADDWIDGET "LABEL" "$BM.TXT_PAL_NO$"
    ENDIF

    IF EQU "$BM.CNF_TV_NTSC$" "1"
        ADDWIDGET "LABEL" "$BM.TXT_NTSC_YES$"
    ELSE
        ADDWIDGET "LABEL" "$BM.TXT_NTSC_NO$"
    ENDIF

    SET "S32" "BM.CNF_PS1_NTSC_VFIX_EN" "1"
    SET "S32" "BM.CNF_PS1_PAL_VFIX_EN" "1"

    SET "S32" "BM.CNF_PS2_NTSC_MODS_EN" "0"
    SET "S32" "BM.CNF_PS2_PAL_MODS_EN" "0"

    IF EQU "$BM.CNF_TV_60HZ$" "1"
        # TV supports 60Hz

        IF EQU "$BM.CNF_TV_NTSC$" "1"
            # If TV supports NTSC color and 60Hz, no fixes are needed for NTSC PS2 games
            SET "BM.CNF_PS2_NTSC_VFIX_EN" "0"
        ELSE
            # If TV supports 60Hz but not NTSC color, force PAL color.
            SET "BM.CNF_PS2_NTSC_VFIX_EN" "1"

            # Force PAL color for NTSC PS2 games
            SET "S32" "BM.CNF_PS2_NTSC_COLOR" "3"
        ENDIF

        # Force 60Hz for NTSC PS1 games
        SET "S32" "BM.CNF_PS1_NTSC_VSYNC" "3"

        # This is a bit of a hack but it seems that PAL TVs display NTSC
        # better if the X position is offset a bit.  So if the BM video mode
        # is set to PAL, assume it's a PAL TV and adjust X
        IF EQU "$BM.CNF_VMODE$" "1"
            SET "S32" "BM.CNF_PS1_NTSC_X_MOD" "40"
            SET "S32" "BM.CNF_PS1_NTSC_Y_MOD" "0"
        ELSE
            SET "S32" "BM.CNF_PS1_NTSC_X_MOD" "0"
            SET "S32" "BM.CNF_PS1_NTSC_Y_MOD" "0"
        ENDIF
    ELSE
        # TV doesn't support 60Hz

        # Force 50Hz for NTSC PS1 games
        SET "S32" "BM.CNF_PS1_NTSC_VSYNC" "2"

        # Enable screen position modiers for NTSC PS1 games
        SET "S32" "BM.CNF_PS1_NTSC_X_MOD" "40"
        SET "S32" "BM.CNF_PS1_NTSC_Y_MOD" "30"

        # Enable NTSC PS2 video fixes
        SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "1"

        # Force 50Hz for NTSC PS2 games.
        SET "S32" "BM.CNF_PS2_NTSC_VSYNC" "2"

        # Force PAL color for NTSC PS2 games.
        SET "S32" "BM.CNF_PS2_NTSC_COLOR" "3"

        # Enable screen position modiers for NTSC PS2 games
        SET "S32" "BM.CNF_PS2_NTSC_MODS_EN" "1"
        SET "S32" "BM.CNF_PS2_NTSC_X_MOD" "50"
        SET "S32" "BM.CNF_PS2_NTSC_Y_MOD" "64"
    ENDIF

    IF EQU "$BM.CNF_TV_NTSC$" "1"
        # TV supports NTSC color

        # Force NTSC color for NTSC PS1 games
        SET "S32" "BM.CNF_PS1_NTSC_COLOR" "2"
    ELSE
        # TV doesn't support NTSC color

        # Force PAL color for NTSC PS1 games
        SET "S32" "BM.CNF_PS1_NTSC_COLOR" "3"

        # Enable NTSC PS2 video fixes
        SET "S32" "BM.CNF_PS2_NTSC_VFIX_EN" "1"

        # Force PAL color for NTSC PS2 games.
        SET "S32" "BM.CNF_PS2_NTSC_COLOR" "3"
    ENDIF

    IF EQU "$BM.CNF_TV_50HZ$" "1"
        # TV supports 50Hz

        IF EQU "$BM.CNF_TV_PAL$" "1"
            # If TV supports PAL color and 50Hz, no fixes are needed for PAL PS2 games
            SET "BM.CNF_PS2_PAL_VFIX_EN" "0"
        ELSE
            # If TV supports 50Hz but not PAL color, force NTSC color.
            # This is an unlikely combination but it could happen...

            SET "BM.CNF_PS2_PAL_VFIX_EN" "1"

            # Force PAL color for NTSC PS2 games
            SET "S32" "BM.CNF_PS2_PAL_COLOR" "2"
        ENDIF

        # Force 50Hz for PAL PS1 games
        SET "S32" "BM.CNF_PS1_PAL_VSYNC" "2"

        SET "S32" "BM.CNF_PS1_PAL_X_MOD" "0"
        SET "S32" "BM.CNF_PS1_PAL_Y_MOD" "0"
    ELSE
        # TV doesn't support 50Hz

        # Force 60Hz for PAL PS1 games
        SET "S32" "BM.CNF_PS1_PAL_VSYNC" "3"

        # Screen position needs to be adjusted
        SET "S32" "BM.CNF_PS1_PAL_X_MOD" "-16"
        SET "S32" "BM.CNF_PS1_PAL_Y_MOD" "-28"

        # Enable PAL PS2 video fixes
        SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "1"

        # Force 60Hz for PAL PS2 games.
        SET "S32" "BM.CNF_PS2_NTSC_VSYNC" "3"

        # Enable screen position modiers for PAL PS2 games
        SET "S32" "BM.CNF_PS2_PAL_MODS_EN" "1"
        SET "S32" "BM.CNF_PS2_PAL_X_MOD" "-20"
        SET "S32" "BM.CNF_PS2_PAL_Y_MOD" "-50"
    ENDIF

    IF EQU "$BM.CNF_TV_PAL$" "1"
        # TV supports PAL color

        # Force PAL color for PAL PS1 games
        SET "S32" "BM.CNF_PS1_PAL_COLOR" "3"
    ELSE
        # TV doesn't support PAL color

        # Force NTSC color for PAL PS1 games
        SET "S32" "BM.CNF_PS1_PAL_COLOR" "2"

        # Enable PAL PS2 video fixes
        SET "S32" "BM.CNF_PS2_PAL_VFIX_EN" "1"

        # Force NTSC color for PAL PS2 games.
        SET "S32" "BM.CNF_PS2_PAL_COLOR" "2"

    ENDIF
    
    ADDWIDGET "LABEL" ""

    SET "BM.CONFIG_CHANGED" "1"

    ADDWIDGET "RETURN" "$BM.TXT_DONE$" "$BM.TXT_RETURN_CONFIG$"

    EXIT 0
