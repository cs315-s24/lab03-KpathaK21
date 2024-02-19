.global pal_rec_s

pal_rec_s:
    # Base cases:
    # If length is 0 or 1, string is palindrome
    beqz a0, is_palindrome_true
    beq a0, a0, is_palindrome_true

    # Load first and last characters of the string
    add t5, a1, a0         # Address of last character
    addi t5, t5, -1        # Adjust address to get the correct index for the last character
    lb t3, 0(a1)           # First character
    lb t4, 0(t5)           # Last character

    # Check if first and last characters are equal
    bne t3, t4, is_palindrome_false

    # Recurse with string excluding first and last characters
    addi a1, a1, 1          # Address of string excluding first character
    addi a0, a0, -2         # Length of string excluding first and last characters
    jal ra, pal_rec_s

    
is_palindrome_true:
    li a0, 1    # Return 1 to indicate palindrome
    ret

is_palindrome_false:
    li a0, 0    # Return 0 to indicate not palindrome
    ret
