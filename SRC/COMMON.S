INCLUDE "macros.inc"

ADDR_OSDHOOK            EQU 0x000FF000

; !NOTE! - You may change this to 0 so that the DVDV hook doesn't "cycle" the tray to trim a couple seconds off
;   the time it takes to boot a DVD Video.  However, this will not work for all versions of DVD player so if
;   your DVD player simply returns to browser, you'll have to turn this back on.  If you use progressive output
;   for DVD, you may also run in to problems if you disable DVDV cycling.
DVDV_CYCLE_TRAY         EQU 1

MECHA_DELAY             EQU 500

