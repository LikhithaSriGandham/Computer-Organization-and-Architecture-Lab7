ORG 100h  ; This tells the assembler that the program will start at memory address 100h

START:
    ; Taking the first single-digit integer input
    MOV AH, 1        ; Function to take single character input
    INT 21h          ; Interrupt to take input from keyboard
    SUB AL, 30h      ; Convert ASCII to integer (subtract 30h from the ASCII value of 0)
    MOV BL, AL       ; Store the first number in BL
    
    ; Taking the second single-digit integer input
    MOV AH, 1        ; Function to take single character input
    INT 21h          ; Interrupt to take input from keyboard
    SUB AL, 30h      ; Convert ASCII to integer
    MOV BH, AL       ; Store the second number in BH
    
    ; Check which number is bigger
    CMP BL, BH       ; Compare BL (first number) and BH (second number)
    JGE CONTINUE     ; If BL >= BH, continue to subtraction
    
    ; If BL < BH, swap the numbers to always subtract the smaller from the larger
    XCHG BL, BH      ; Exchange BL and BH
    MOV DL, '-'      ; Load '-' into DL for printing the minus sign
    MOV AH, 2        ; Function to print a character
    INT 21h          ; Interrupt to print '-'

CONTINUE:
    ; Perform the subtraction: BL - BH
    MOV AL, BL       ; Move first number (BL) to AL
    SUB AL, BH       ; Subtract second number (BH) from AL
    
    ; Convert result to ASCII for display
    ADD AL, 30h      ; Convert integer result to ASCII
    MOV DL, AL       ; Move result to DL for printing
    MOV AH, 2        ; Function to print a character
    INT 21h          ; Interrupt to print result
    
    ; End the program
    MOV AH, 4Ch      ; Function to terminate the program
    INT 21h          ; Interrupt to terminate

END START
