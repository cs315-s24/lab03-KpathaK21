.global sumarr_rec_s

sumarr_rec_s:
    # Prologue
    addi    sp, sp, -16         # Adjust stack pointer
    sd      ra, 0(sp)           # Save return address
    sd      s0, 8(sp)           # Save s0
    
    # Base case: if start == end
    beq     a1, a2, base_case   # If start equals end, return arr[start]

    # Recursive case
    lw      s0, 0(a0)           # Load current element into s0
    addi    a0, a0, 4           # Move pointer to next element in the array
    addi    a1,a1, 1
    jal     ra, sumarr_rec_s    # Recursive call

    # Add current element to the sum
    add     a0 , a0, s0          # s0 = arr[start] + sumarr_rec_s(arr, start + 1, end)

    # Epilogue
    ld      ra, 0(sp)           # Restore return address
    ld      s0, 8(sp)           # Restore s0
    addi    sp, sp, 16          # Restore stack pointer
    ret

    
base_case:
    ld      a0, 0(a0)           # Load arr[start] into s0
    j       end_sumarr_rec_s    # Jump to epilogue

end_sumarr_rec_s:
	ld      s0, 8(sp)           # Restore s0
    ld      ra, 0(sp)           # Restore return address
    addi    sp, sp, 16          # Restore stack pointer
    ret
