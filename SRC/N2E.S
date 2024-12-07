n2e_decompress      PROC

                        move        v1, a1

                        move        t9, ra

                        move        t0, zero
                        li      t2, 1
                        lui         t6, 0xff

main_loop:
                        bual    getbit
                        nop
                        beqz        v0, m_off_loop
                        li      t3, 1
                        lbu     t1, 0(a0)
                        addiu       a0, 1
                        sb      t1, 0(a1)
                        bu    main_loop
                        addiu       a1, 1

m_off_loop:
                        bual    getbit
                        sll     t3, 1
                        bual    getbit
                        addu        t3, v0
                        bnez        v0, exit_m_off_loop
                        addiu       t3, -1
                        bual    getbit
                        sll     t3, 1
                        bu      m_off_loop
                        addu        t3, v0

exit_m_off_loop:
                        addiu       t3, -1
                        bnez        t3, m_off_diff_2
                        nop
                        bual    getbit
                        move        t3, t2
                        bu    exit_if_moff_eq_2
                        move        t4, v0

m_off_diff_2:
                        addiu       t3, -1
                        lbu     t1, 0(a0)
                        sll     t3, 8
                        addiu       a0, 1
                        addu        t3, t1
                        addiu       t1, t3, 1
                        bnez        t1, break_cond
                        subu        v0, a1, v1
                        jr      t9
break_cond:
                        andi        t4, t1, 1
                        srl     t3, 1
                        addiu       t3, 1
                        move        t2, t3
exit_if_moff_eq_2:
                        bual    getbit
                        nop
                        beqz        t4, else_1
                        nop
                        bu    exit_if
                        addiu       t4, v0, 3
else_1:
                        bnez        v0, else_2_reversed
                        nop

                        addiu       t4, 1
while_m_len:
                        bual    getbit
                        sll     t4, 1
                        bual    getbit
                        addu        t4, v0
                        beqz        v0, while_m_len
                        nop
                        bu    exit_if
                        addiu       t4, 5

else_2_reversed:
                        bual    getbit
                        nop
                        addiu       t4, v0, 5
exit_if:
                        sltiu       t1, t3, 0x501
                        subu        t4, t1

                        subu        t5, a1, t3

copy_loop:
                        lbu     t1, 0(t5)
                        addiu       t5, 1
                        sb      t1, 0(a1)
;                        nop                                            ; bloat! ;)
                        addiu       t4, -1
                        bnez        t4, copy_loop
                        addiu       a1, 1

                        bu    main_loop
                        nop

n2e_decompress          ENDP


getbit                  PROC
                        and     t1, t0, t6
                        bnez        t1, bb_okay
                        lbu     t1, 0(a0)
                        nop
                        addiu       a0, 1
                        or      t0, t1, t6

bb_okay:
                        srl     v0, t0, 7
                        sll     t0, 1
                        jr      ra
                        andi        v0, 1
getbit                  ENDP
