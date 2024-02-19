.global fib_rec_s

fib_rec_s:
    addi    sp, sp, -16         # Adjust stack pointer to save 16 bytes
    sd      ra, 8(sp)           # Save return address
    sd      s0, 0(sp)           # Save s0

    mv      s0, a0              # Load argument 'n' from a0

    blez    s0, fib_base_case   # Base case: if n <= 1, return n

    li      s1, 0                # Initialize s1 to 0 (F(n - 1))
    li      s2, 1                # Initialize s2 to 1 (F(n - 2))

fib_loop:
    addi    s0, s0, -1           # Decrement n
    bgtz    s0, fib_recursion    # If n > 0, go to recursion
    mv      a0, s2               # Return F(n - 2)
    j       end_fib_rec_s        # Jump to the end

fib_recursion:
    add     t0, s1, s2           # Calculate F(n) = F(n - 1) + F(n - 2)
    mv      s1, s2               # Update F(n - 1) to F(n - 2)
    mv      s2, t0               # Update F(n - 2) to F(n)
    j       fib_loop             # Repeat the loop


fib_base_case:
    # Base case: if n <= 1, return n
    mv      a0, s0               # Return n

end_fib_rec_s:
    ld      ra, 8(sp)           # Restore return address
    ld      s0, 0(sp)           # Restore s0
    addi    sp, sp, 16          # Restore stack pointer
    ret
