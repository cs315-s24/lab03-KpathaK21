.global pal_rec_s

pal_rec_s:

    bge a1, a2, return_true     # If a2 < a1, then the string is empty or has one character, so its a palindrome
    beqz a1, return_true         # Single character string is a palindrome

    bge a1, a2, return_true   # If a1 >= a2, all characters have been compared, and its a palindrome
        
        # Load characters from memory
        lb t0, 0(a1)   # Load character from start index
        lb t1, 0(a2)   # Load character from end index

        # Compare characters
        bne t0, t1, return_false    # Characters dont match, not a palindrome

        # Move to the next characters
        addi a1, a1, 1          # Move start index forward
        addi a2, a2, -1         # Move end index backward
        jal pal_rec_s          # Repeat the loop

return_true:
    li a0, 1                # return true
    ret
    
return_false:
    li a0, 0                # return false
    ret
