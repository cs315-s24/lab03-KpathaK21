.global sumarr_rec_s

sumarr_rec_s:
    # Prologue
    addi    sp, sp, -16         # Adjust stack pointer
    sd      ra, 8(sp)           # Save return address
    sd      s0, 0(sp)           # Save s0
    
    # Base case: if start == end
    beqz    a1, a2, base_case   # If start equals end, return arr[start]

    # Recursive case
    lw      s0, 0(a0)           # Load arr[start] into s0
    addi    a1, a1, 1           # Increment start index
    add     a0, a0, 4           # Move pointer to next element in the array
    jal     ra, sumarr_rec_s    # Recursive call


    # The sum of the current element and the sum of the rest of the array
    add     s0, s0, t0          # s0 = arr[start] + sumarr_rec_s(arr, start + 1, end)

    # Epilogue
    ld      ra, 8(sp)           # Restore return address
    ld      s0, 0(sp)           # Restore s0
    addi    sp, sp, 16          # Restore stack pointer
    ret

base_case:
    lw      s0, 0(a0)           # Load arr[start] into s0
    j       end_sumarr_rec_s    # Jump to epilogue

end_sumarr_rec_s:
    ld      ra, 8(sp)           # Restore return address
    ld      s0, 0(sp)           # Restore s0
    addi    sp, sp, 16          # Restore stack pointer
    ret
