.global pal_rec_s

pal_rec_s:
# Save registers on the stack
    addi sp, sp, -12        # Reserve space on the stack
    sw ra, 0(sp)            # Save return address
    sw a0, 4(sp)            # Save pointer to string
    sw a1, 8(sp)            # Save start index
    sw a2, 12(sp)

    # Base case: if start index is greater or equal to end index, its a palindrome
    beq a1, a2, palindrome

    # Compare characters at start and end index
    lb t0, 0(a0)            # Load character at start index
    lb t1, 0(a2)            # Load character at end index
    bne t0, t1, notPalindrome   # If not equal, not a palindrome


    # Recursive call with incremented start index and decremented end index
    addi a0, a0, 1          # Increment pointer to string
    addi a1, a1, 1          # Increment start index
    addi a2, a2, -1         # Decrement end index
    jal pal_rec_s           # Recursive call

    # Restore registers from the stack
    lw ra, 0(sp)            # Restore return address
    lw a0, 4(sp)            # Restore pointer to string
    lw a1, 8(sp)            # Restore start index
    lw a2, 12(sp)
    addi sp, sp, 12         # Release space on the stack

    j endPalindromeCheck    # Jump to end


palindrome:
    li a0, 1                # Palindrome
    j endPalindromeCheck    # Jump to end

notPalindrome:
    li a0, 0                # Not a palindrome

endPalindromeCheck:
    ret                     # Return
