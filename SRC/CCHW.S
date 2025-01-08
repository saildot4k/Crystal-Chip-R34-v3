;
; Crystal Chip hardware interface library v2.1
;

CC_MAGIC1               EQU 0xC0
CC_MAGIC2               EQU 0xCA

CC_WRITE_EEP            EQU 0x00
CC_READ_EEP             EQU 0x81
CC_SET_BIOS_CTRL        EQU 0x02
CC_SET_CDVD_CTRL        EQU 0x03
CC_DISABLE_IF           EQU 0x04
CC_WRITE_SRAM           EQU 0x05
CC_GET_VERSION          EQU 0x06
CC_SPI_TXFER            EQU 0x87
CC_SPI_TXFER_BURST      EQU 0xC7

; Bits for CC BIOS_CTRL register
BIOS_MCEXEC_EN          EQU (1 << 0)
BIOS_MM16_EN            EQU (1 << 1)
BIOS_LOGO_EN            EQU (1 << 2)
BIOS_READKEY_EN         EQU (1 << 3)
BIOS_OSDRAM_EN          EQU (1 << 4)
BIOS_OSDROM_EN          EQU (1 << 5)
BIOS_IOPBOOT_EN         EQU (1 << 7)

; Bits for CC CDVD_CTRL register.
CDVD_MECHA_EN           EQU (1 << 0)
CDVD_SCEX_EN            EQU (1 << 1)
CDVD_BT_EN              EQU (1 << 7)

; Bits for PS1 disc authentication region in the CC CDVD Patch Control register
CDVD_SCEI               EQU (0 << 2)
CDVD_SCEA               EQU (1 << 2)
CDVD_SCEE               EQU (2 << 2)

CPU_EE EQU 1
CPU_IOP EQU 2

IF CPU_TYPE == 0
ERROR "CPU type must be defined!"
ENDIF

IF CPU_TYPE == CPU_EE
; EE-compatible usleep, CC_PEEK and CC_POKE
usleep                  PROC

                        li          at, 300
                        mult        t0, a0, at

                        mtc0        zero, Count
                        sync.p

_l1:
                        mfc0        t2, Count
                        sltu        at, t2, t0
                        bnez        at, _l1
                        nop

                        jr          ra
                        nop

usleep                  ENDP

CC_PEEK                 PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)

                        lui         v0, 0x1FC0
                        lbu         v0, 0x01AD(v0)
                        sb          v0, 0x04(sp)

                        bual        usleep
                        li          a0, 4

                        lbu         v0, 0x04(sp)

                        lw          ra, 0x00(sp)
                        jr          ra
                        addiu       sp, sp, 0x10

CC_PEEK                 ENDP

CC_POKE                 PROC

                        lui         v0, 0x1FC0
                        sb          a0, 0x01AD(v0)
                        bu          usleep
                        li          a0, 4

CC_POKE                 ENDP

ELSE

; IOP-compatible usleep, CC_PEEK and CC_POKE

usleep                  PROC

_l1:
                        li          at, 16
_l2:
                        addiu       at, at, -1
                        bgtz        at, _l2
                        nop

                        addiu       a0, a0, -1
                        bgtz        a0, _l1
                        nop

                        jr          ra
                        nop

usleep                  ENDP

CC_PEEK                 PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)

                        lui         v0, 0xBFC0
                        lbu         v0, 0x01AD(v0)
                        nop
                        sb          v0, 0x04(sp)

                        bual        usleep
                        li          a0, 2

                        lbu         v0, 0x04(sp)

                        lw          ra, 0x00(sp)
                        nop
                        jr          ra
                        addiu       sp, sp, 0x10

CC_PEEK                 ENDP

CC_POKE                 PROC

                        lui         v0, 0xBFC0
                        sb          a0, 0x01AD(v0)
                        nop
                        bu          usleep
                        li          a0, 2

CC_POKE                 ENDP

ENDIF

; All code from here on should be compatible with both EE and IOP(respect instruction delay slots)

CC_SendPacket           PROC

                        addiu       sp, sp, -0x20
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)
                        sw          s2, 0x0C(sp)
                        sw          s3, 0x10(sp)

                        or          s0, zero, a0                        ; s0 = pkt

_l1:
                        or          t0, zero, a0                        ; p = pkt;
                        li          t1, 4                               ; i = 4;
                        li          s1, 0                               ; addsum = 0;

_l2:
                        andi        at, t0, 0xFF
                        addiu       t1, t1, -1                          ; i--;
                        addu        s1, s1, at                          ; addsum += p & 0xFF;
                        bgtz        t1, _l2
                        srl         t0, t0, 8                           ; p >>= 8;

                        andi        s1, s1, 0xFF                        ; addsum &= 0xFF;

_l3:
                        bual        CC_POKE
                        li          a0, CC_MAGIC1


                        bual        CC_POKE
                        li          a0, CC_MAGIC2

                        li          s2, 4                               ; i = 4
                        or          s3, zero, s0                        ; p = pkt
_l4:
                        bual        CC_POKE                             ; send each byte of the 4-byte packet
                        andi        a0, s3, 0xFF

                        addiu       s2, s2, -1
                        bgtz        s2, _l4
                        srl         s3, s3, 8

                        bual        CC_POKE                             ; send addsum byte
                        andi        a0, s1, 0xFF

                        bual        CC_PEEK                             ; get back result_byte from FPGA
                        nop

                        andi        at, v0, 0xF0
                        bnez        at, _l3                             ; if(result_byte & 0xF0) retry
                        nop

                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        lw          s2, 0x0C(sp)
                        lw          s3, 0x10(sp)
                        jr          ra
                        addiu       sp, sp, 0x20

CC_SendPacket           ENDP

IF _F_CC_BurstExtraIn

; int CC_BurstExtraIn(void *in_buf, int n_in);
CC_BurstExtraIn         PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)
                        sw          s2, 0x0C(sp)
                        nop

                        blez        a1, _done
                        li          s2, 0                               ; addsum = 0;

                        or          s0, zero, a0
                        or          s1, zero, a1

_l1:
                        bual        CC_PEEK
                        addiu       s1, s1, -1                          ; n_in--;

                        sb          v0, 0x00(s0)                        ; *in_buf = mosi_byte;
                        addiu       s0, s0, 1                           ; in_buf++;

                        bgtz        s1, _l1
                        addu        s2, s2, v0                          ; addsum += mosi_byte;

_done:
                        bual        CC_POKE
                        li          a0, 0

                        bual        CC_PEEK
                        andi        s2, s2, 0xFF

                        xor         v0, v0, s2

                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        lw          s2, 0x0C(sp)
                        nop
                        jr          ra
                        addiu       sp, sp, 0x10

CC_BurstExtraIn         ENDP
ENDIF

IF _F_CC_MultiOutCmd

; int CC_MultiOutCmd(u8 cmd, u16 addr, u8 *out_buf, int n_out, int busy_delay)
CC_MultiOutCmd          PROC

                        addiu       sp, sp, -0x20
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)
                        sw          s2, 0x0C(sp)
                        sw          s3, 0x10(sp)
                        sw          s4, 0x14(sp)

                        andi        s0, a0, 0xFF                        ; s0 = cmd
                        or          s1, zero, a1                        ; s1 = addr
                        or          s2, zero, a2                        ; s2 = out_buf
                        or          s3, zero, a3                        ; s3 = n_out
                        or          s4, zero, t0                        ; s4 = busy_delay

_l1:
                        blez        s3, _done
                        addiu       s3, s3, -1

                        andi        at, s1, 0xFF00
                        or          a0, s0, at

                        andi        at, s1, 0xFF
                        sll         at, at, 16
                        or          a0, a0, at

                        lbu         at, 0x00(s2)
                        nop
                        sll         at, at, 24
                        bual        CC_SendPacket
                        or          a0, a0, at

                        blez        s4, _no_delay
                        nop

                        bual        usleep
                        or          a0, zero, s4

_no_delay:
                        addiu       s1, s1, 1
                        bu          _l1
                        addiu       s2, s2, 1

_done:
                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        lw          s2, 0x0C(sp)
                        lw          s3, 0x10(sp)
                        lw          s4, 0x14(sp)
                        nop
                        jr          ra
                        addiu       sp, sp, 0x20

CC_MultiOutCmd          ENDP
ENDIF

IF _F_CC_MultiInCmd
; int CC_MultiInCmd(u8 cmd, u16 addr, u8 *in_buf, int n_in, int busy_delay)
CC_MultiInCmd          PROC

                        addiu       sp, sp, -0x20
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)
                        sw          s2, 0x0C(sp)
                        sw          s3, 0x10(sp)
                        sw          s4, 0x14(sp)

                        andi        s0, a0, 0xFF                        ; s0 = cmd
                        or          s1, zero, a1                        ; s1 = addr
                        or          s2, zero, a2                        ; s2 = in_buf
                        or          s3, zero, a3                        ; s3 = n_in
                        or          s4, zero, t0                        ; s4 = busy_delay

_l1:
                        blez        s3, _done
                        addiu       s3, s3, -1

                        andi        at, s1, 0xFF00
                        or          a0, s0, at

                        andi        at, s1, 0xFF
                        sll         at, at, 16
                        or          s5, a0, at

_l2:
                        bual        CC_SendPacket
                        or          a0, zero, s5

                        blez        s4, _no_delay
                        nop

                        bual        usleep
                        or          a0, zero, s4

_no_delay:
                        bual        CC_PEEK
                        nop

                        sb          v0, 0x00(s2)
                        bual        CC_PEEK
                        nop

                        lbu         at, 0x00(s2)
                        xori        v0, v0, 0xFF
                        bne         v0, at, _l2
                        nop

                        addiu       s1, s1, 1
                        bu          _l1
                        addiu       s2, s2, 1

_done:
                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        lw          s2, 0x0C(sp)
                        lw          s3, 0x10(sp)
                        lw          s4, 0x14(sp)
                        jr          ra
                        addiu       sp, sp, 0x20

CC_MultiInCmd          ENDP
ENDIF

IF _F_CC_BIOS_SetPatchCtrl
CC_BIOS_SetPatchCtrl          PROC

                        sll         a0, a0, 8
                        bu          CC_SendPacket
                        ori         a0, a0, CC_SET_BIOS_CTRL

CC_BIOS_SetPatchCtrl          ENDP
ENDIF

IF _F_CC_CDVD_SetPatchCtrl
CC_CDVD_SetPatchCtrl          PROC

                        sll         a0, a0, 8
                        bu          CC_SendPacket
                        ori         a0, a0, CC_SET_CDVD_CTRL

CC_CDVD_SetPatchCtrl          ENDP
ENDIF

IF _F_CC_EEP_Read
CC_EEP_Read             PROC

                        or          a3, zero, a2
                        or          a2, zero, a1
                        or          a1, zero, a0
                        li          a0, CC_READ_EEP
                        bu          CC_MultiInCmd
                        li          t0, 10

CC_EEP_Read             ENDP
ENDIF

IF _F_CC_SRAM_Write
CC_SRAM_Write           PROC

                        or          a3, zero, a2
                        or          a2, zero, a1
                        or          a1, zero, a0
                        li          a0, CC_WRITE_SRAM
                        bu          CC_MultiOutCmd
                        li          t0, 0

CC_SRAM_Write           ENDP
ENDIF

; CC DataFlash functions for CC1.2 and higher

IF _F_CC_SPI_ExchangeByte
CC_SPI_ExchangeByte     PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)

                        sll         a0, a0, 8
                        or          a0, a0, a1
                        sll         a0, a0, 16
                        ori         a0, a0, CC_SPI_TXFER
                        sw          a0, 0x0C(sp)

_l1:
                        bual        CC_SendPacket
                        nop

                        bual        CC_PEEK
                        nop

                        bual        CC_PEEK
                        or          s1, zero, v0

                        xori        v0, v0, 0xFF
                        bne         v0, s1, _l1
                        lw          a0, 0x0C(sp)

                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        jr          ra
                        addiu       sp, sp, 0x10

CC_SPI_ExchangeByte     ENDP
ENDIF

IF _F_CC_SPI_TransferBurstIn
; void CC_SPI_TransferBurstIn(void *in_buf, int n_in);
CC_SPI_TransferBurstIn  PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)
                        sw          a0, 0x04(sp)
                        sw          a1, 0x08(sp)
                        nop

_l1:
                        bual        CC_SendPacket
                        li          a0, CC_SPI_TXFER_BURST

                        lw          a0, 0x04(sp)
                        lw          a1, 0x08(sp)
                        bual        CC_BurstExtraIn
                        nop

                        bnez        v0, _l1
                        nop

                        lw          ra, 0x00(sp)
                        nop
                        jr          ra
                        addiu       sp, sp, 0x10

CC_SPI_TransferBurstIn  ENDP
ENDIF

IF _F_CC_DF_ReadStatus
CC_DF_ReadStatus        PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)

                        li          a0, 0xD7
                        bual        CC_SPI_ExchangeByte
                        li          a1, 0

                        li          a0, 0x00
                        bual        CC_SPI_ExchangeByte
                        li          a1, 1

                        lw          ra, 0x00(sp)
                        nop
                        jr          ra
                        addiu       sp, sp, 0x10

CC_DF_ReadStatus        ENDP
ENDIF

IF _F_CC_DF_SendCmd
; void CC_DF_SendCmd(u8 opcode, u16 paddr, u16 baddr, int n_cmd);
CC_DF_SendCmd           PROC

                        addiu       sp, sp, -0x20
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)

                        la          at, dfdev
                        lw          at, 0x04(at)
                        nop
                        jalr        at
                        or          s0, zero, a3                        ; s0 = n_cmd;

                        sw          v0, 0x10(sp)
                        sw          zero, 0x14(sp)

                        addiu       s1, sp, 0x10
_l1:
                        lbu         a0, 0x00(s1)
                        bual        CC_SPI_ExchangeByte
                        li          a1, 0

                        addiu       s0, s0, -1
                        bgtz        s0, _l1
                        addiu       s1, s1, 1

                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        jr          ra
                        addiu       sp, sp, 0x20

CC_DF_SendCmd           ENDP
ENDIF

IF _F_CC_DF_Read

; void CC_DF_Read(u32 addr, void *buf, int n_bytes);
CC_DF_Read              PROC

                        addiu       sp, sp, -0x10
                        sw          ra, 0x00(sp)
                        sw          a1, 0x04(sp)
                        sw          a2, 0x08(sp)

                        la          at, dfdev
                        lw          at, 0x00(at)                        ; at = dfdev.bytes_per_page
                        nop

                        divu        a0, at
                        nop
                        li          a0, 0xE8
                        mflo        a1                                  ; paddr = (addr / dfdev.bytes_per_page)
                        mfhi        a2                                  ; baddr = (addr % dfdev.bytes_per_page)
                        bual        CC_DF_SendCmd                       ; CC_DF_SendCmd(0xE8, paddr, baddr, 8);
                        li          a3, 8

                        lw          a0, 0x04(sp)
                        lw          a1, 0x08(sp)
                        bual        CC_SPI_TransferBurstIn
                        nop

                        li          a0, 0
                        bual        CC_SPI_ExchangeByte
                        li          a1, 3

                        lw          ra, 0x00(sp)
                        nop
                        jr          ra
                        addiu       sp, sp, 0x10

CC_DF_Read              ENDP
ENDIF

IF _F_CC_DF_Detect

; v1 of 0x07 setting for AT45DB621E Simplified so only 0x05,0x06 apply 528byte pages
; AT45DB Family D7H Opcode Section 11.4
; Bits 5 through 2 indicate size but have no meaning in decimal
; Shift Right 3, then mask lowest 3 bits
; AT45DB011B    10001100    001 0x01 DF_Page264  128KB ( 1Mbit) CC1.1 Late/ CC1.2
; AT45DB021D    10010100    010 0x02 DF_Page264  256KB ( 2Mbit)
; AT45DB041D	10011100	011 0x03 DF_Page264  512KB ( 4Mbit)
; AT45DB081D	10100100	100 0x04 DF_Page264  1MB   ( 8MBit) CC2.0 PRO
; AT45DB161D	10101100	101 0x05 DF_Page528  2MB   (16Mbit) CC2.0 PRO SLE
; AT45DB321D	10110100	110 0x06 DF_Page528  4MB   (32Mbit)
; AT45DB641E	10111100	111 0x07 DF_Page1056 8MB   (64Mbit)

CC_DF_Detect            PROC
    addiu       sp, sp, -0x10
    sw          ra, 0x00(sp)
    nop
    bual        CC_DF_ReadStatus
    nop
    srl         t1, v0, 3         ; Shift right by 3 bits
    andi        t1, t1, 0x07      ; Mask the lowest 3 bits

    li          at, 0x05          ; Check if t1 == 0x05
    beq         t1, at, _set_528bytes
    li          at, 0x06          ; Check if t1 == 0x06
    beq         t1, at, _set_528bytes

_set_264bytes:
    li          t2, 264           ; Set page size for 264-byte dataflash
    la          t3, DF_Page264    ; Set DF_Page handler for DF_Page264
    b           _done

_set_528bytes:
    li          t2, 528           ; Set page size for 528-byte dataflash
    la          t3, DF_Page528    ; Set DF_Page handler for DF_Page528

_done:
    la          v0, dfdev
    sw          t2, 0x00(v0)
    lw          ra, 0x00(sp)
    sw          t3, 0x04(v0)
    jr          ra
    addiu       sp, sp, 0x10
CC_DF_Detect            ENDP
ENDIF

; void DF_Page264(u8 opcode, u16 paddr, u16 baddr);
DF_Page264              PROC

                        andi        v0, a2, 0xFF
                        sll         v0, v0, 8                           ; v0 = (baddr & 0xFF) << 8

                        srl         a2, a2, 8
                        andi        a2, a2, 1
                        or          v0, v0, a2

                        sll         v1, a1, 1
                        andi        v1, v1, 0xFE
                        or          v0, v0, v1

                        sll         v0, v0, 8

                        srl         a1, a1, 7
                        or          v0, v0, a1
                        sll         v0, v0, 8

                        jr          ra
                        or          v0, v0, a0

DF_Page264              ENDP

; void DF_Page528(u8 opcode, u16 paddr, u16 baddr);
DF_Page528              PROC

                        andi        v0, a2, 0xFF
                        sll         v0, v0, 8                           ; v0 = (baddr & 0xFF) << 8

                        srl         a2, a2, 8
                        andi        a2, a2, 3
                        or          v0, v0, a2

                        sll         v1, a1, 2
                        andi        v1, v1, 0xFC
                        or          v0, v0, v1

                        sll         v0, v0, 8

                        srl         a1, a1, 6
                        or          v0, v0, a1
                        sll         v0, v0, 8

                        jr          ra
                        or          v0, v0, a0

DF_Page528              ENDP

dfdev                   TABLE
df_bytes_per_page:      DW          0
df_format_cmd:          DW          0
dfdev                   ENDT

ENDIF
