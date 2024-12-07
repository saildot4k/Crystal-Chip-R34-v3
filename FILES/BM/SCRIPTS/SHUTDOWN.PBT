#
# Crystal Chips BootManager Shutdown Script v1.3
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
# This script is used by BootManager(BM) to handle shutting down of devices.
#

IF EQU "$BM.HDD_LOADED$" "1"
    UNMOUNT "pfs0:"
    SET "BM.HDD_LOADED" 0
ENDIF
