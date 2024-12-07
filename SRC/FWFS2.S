
LoadFileFWFS            PROC

                        addiu       sp, sp, -0x20
                        sw          ra, 0x00(sp)
                        sw          s0, 0x04(sp)
                        sw          s1, 0x08(sp)

                        la          v0, fwfs_index
                        sll         at, a0, 4
                        addu        s0, v0, at                          ; s0 = &fwfs_index[fno];

                        or          s1, zero, a1                        ; s1 = load_address

                        lw          v0, 0x04(s0)                        ; at = fwfs_index[fno].attr
                        lw          a0, 0x08(s0)                        ; a0 = fwfs_index[fno].addr

                        beqz        v0, _no_unpack
                        li          at, FWFS_TEMP_ADDR
                        
                        move        a1, at
_no_unpack:

IF CC_USE_EEP
                        jal         CC_EEP_Read
ELSE
                        jal         CC_DF_Read
ENDIF
                        lw          a2, 0x0C(s0)                        ; a2 = fwfs_index[fno].size
                                                
                        lw          at, 0x04(s0)
                        nop
                        beqz        at, _done
                        lw          v0, 0x0C(s0)                        ; if(!fwfs_index[fno].attr) { return(fwfs_index[fno].size); }

                        la          a0, FWFS_TEMP_ADDR
                        ;bual        n2e_decompress                      ; return(n2e_decompress(FWFS_TEMP_ADDR, load_addr));
                        or          a1, zero, s1
_done:

                        lw          ra, 0x00(sp)
                        lw          s0, 0x04(sp)
                        lw          s1, 0x08(sp)
                        jr          ra
                        addiu       sp, sp, 0x20

LoadFileFWFS            ENDP
