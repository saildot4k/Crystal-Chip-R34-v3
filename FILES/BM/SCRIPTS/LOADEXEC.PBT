#
# Crystal Chips BootManager "Load and Execute" PBAT Script v1.1
#
# (c) 2005-2006 Crystal Chips - http://www.crystal-chips.com/
#
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file is unmodified.  If you modify this script and distribute it,
#   please edit this text.  Please do not change the copyright information.
#
# Description:
#
# This script is used by BootManager(BM) to load and execute PS2 ELF files.
# It should not be necessary to edit this file.
#

IF EQU "moduleload" "$ARG1$"

ELSEIF MATCHES "moduleload2*" "$ARG1$"

ELSE
    SET "BM.EXEC_DEV_PBT" ""
    LOADEXEC "PBATS" "$BM.BM_PATH$/DEVS/*/DEVINFO.PBT" "CHECK" "$ARG1$" "BM.EXEC_DEV_PBT"
    IF EQU "$BM.EXEC_DEV_PBT$" ""
        ECHO "Unknown device for file '$ARG1$'!"
        RETURN "-1"
    ENDIF

    LOADEXEC "PBAT" "$BM.EXEC_DEV_PBT$" "LOADEXEC" "$ARG1$" $ARG2$
ENDIF

# Do not change this line!
LOADEXEC "EEELF" "$ARG1$" $ARG2$
