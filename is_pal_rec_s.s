.global pal_rec_s


pal_rec_s:
    # Base cases:
    # If length is 0 or 1, string is palindrome 
    beqz  a1, is_palindrome_true
    bge a1, a2, is_palindrome_true    # Check if start >= end, if not, proceed to check palindrome

    lbu t0, 0(a1)                  # Load a byte from the start pointer
    lbu t1, 0(a2)                  # Load a byte from the end pointer
    bne t0, t1, is_palindrome_false    # If the characters at start and end pointers are not equal, its not a palindrome
    
    addi a1, a1, 1                  # Move start pointer to next character
    addi a2, a2, -1                 # Move end pointer to previous character
    jal ra, pal_rec_s               # Recursively call pal_rec_s
    
    
is_palindrome_false:
    li a0, 0                        # Return 0 to indicate not palindrome
    ret

is_palindrome_true:
    li a0, 1                        # If start > end, it means the string is empty or has one character, so its a palindrome
    ret
