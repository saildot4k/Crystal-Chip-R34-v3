#
# Crystal Chips BootManager Media Content PBAT Script v1.4
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
# This script is used by BootManager(BM) to determine media contents of a device.
#

KEEP

IF NOT MATCHES "cdrom*" "$ARG1$"
    GOTO "OTHER_MEDIA"
ENDIF

:CDROM_MEDIA

# Display "Unknown" disc icon.
SET "BM.SHOW_DISC_IMG" "1"
SET "BM.DISC_IMG_NAME" "$BM.BM_PATH$/GFX/ICNUNKNWN.TGA"

GETDISKTYPE "DISK_TYPE"

SWITCH "$DISK_TYPE$"
    CASE "PS1_CD"
        SET "MEDIA_TYPE" "CD"
        BREAK
    CASE "PS2_CD"
        SET "MEDIA_TYPE" "CD"
        BREAK
    CASE "CDDA"
        SET "MEDIA_TYPE" "CD"
        BREAK
    CASE "PS2_DVD"
        SET "MEDIA_TYPE" "DVD"
        BREAK
    CASE "DVDV"
        SET "MEDIA_TYPE" "DVD"
        BREAK
    CASE "NONE"
    DEFAULT
        ECHO "Default!"
        GOTO OTHER_CHECKS
        BREAK
ENDS

SET "$BM.DISC_CONTENT$" "NONE"

IF EQU "$DISK_TYPE$" "DVDV"
    SET "BM.DISC_CONTENT" "DVDV"
ELSEIF EQU "$DISK_TYPE$" "CDDA"
    SET "BM.DISC_CONTENT" "CDDA"
ELSEIF FAIL PARSECNF "cdrom0:\SYSTEM.CNF" "BM.BOOT_TYPE" "BM.BOOT_NAME"
    IF EQU "$MEDIA_TYPE$" "CD"
        IF EXISTS "cdrom0:\PSX.EXE"
            SET "BM.DISC_CONTENT" "PS1"
            SET "BM.BOOT_TYPE" "PS1"
            SET "BM.BOOT_NAME" "SLUS_123.45"
        ELSEIF EXISTS "cdrom0:\PS2.ELF"
            SET "BM.DISC_CONTENT" "PS2"
            SET "BM.BOOT_TYPE" "PS2"
            SET "BM.BOOT_NAME" "cdrom0:\PS2.ELF"
        ELSE
            ECHO "Unknown CD content!"
            GOTO OTHER_CHECKS
        ENDIF
    ELSE
        IF EXISTS "cdrom0:\VIDEO_TS"
            SET "BM.DISC_CONTENT" "DVDV"
        ELSE
            ECHO "Unknown DVD content!"
            GOTO OTHER_CHECKS
        ENDIF
    ENDIF
ELSE
    IF EQU "$MEDIA_TYPE$" "CD"
        IF EQU "$BM.BOOT_TYPE$" "PS1"
            SET "BM.DISC_CONTENT" "PS1"
        ELSEIF EQU "$BM.BOOT_TYPE$" "PS2"
            SET "BM.DISC_CONTENT" "PS2"
        ELSE
            ECHO "Unknown CD content!"
            GOTO OTHER_CHECKS
        ENDIF
    ELSE
        IF EQU "$BM.BOOT_TYPE$" "PS2"
            SET "BM.DISC_CONTENT" "PS2"
        ELSE
            ECHO "Unknown DVD content!"
            GOTO OTHER_CHECKS
        ENDIF
    ENDIF
ENDIF

SWITCH "$BM.DISC_CONTENT$"
    CASE "PS1"
        # Display PS1 disc icon.
        SET "BM.DISC_IMG_NAME" "DISC_ICN_PS1"
        SET "BM.SHOW_DISC_IMG" "1"
        BREAK
    CASE "PS2"
        # Display PS2 disc icon.
        SET "BM.DISC_IMG_NAME" "DISC_ICN_PS2"
        SET "BM.SHOW_DISC_IMG" "1"
        BREAK
    CASE "DVDV"
        # Display Video disc icon.
        SET "BM.DISC_IMG_NAME" "DISC_ICN_VIDEO"
        SET "BM.SHOW_DISC_IMG" "1"
        BREAK
    CASE "CDDA"
        # Display Music disc icon.
        SET "BM.DISC_IMG_NAME" "DISC_ICN_MUSIC"
        SET "BM.SHOW_DISC_IMG" "1"
        BREAK
    DEFAULT
        # Display "Unknown" disc icon.
        SET "BM.DISC_IMG_NAME" "DISC_ICN_UNKNOWN"
        SET "BM.SHOW_DISC_IMG" "1"
        BREAK
ENDS

:OTHER_MEDIA

# Call all the scripts in BM/MEDIAS
LOADEXEC "PBATS" "$BM.BM_PATH$/MEDIAS/*.PBT" "CHECK" "$ARG1$"
