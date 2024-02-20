.global pal_rec_s

pal_rec_s:

	bge a1, a2, return_true   # If a1 >= a2, all characters have been compared, and its a palindrome
     
  # Load characters from memory
   add t0, a0, a1
   lb t0, (t0)   # Load character from start index
   add t1, a0, a2
   lb t1, (t1)   # Load character from end index

   
  # Compare characters
     bne t0, t1, return_false    # Characters dont match, not a palindrome

	beq t0, t1, return_true

 
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
