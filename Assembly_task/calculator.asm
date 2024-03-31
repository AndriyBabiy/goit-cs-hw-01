org 0x100                  ; Indicate that it is a .COM file
section .data
  a db 5                   ; Assign the value 5 to a
  b db 3                   ; Assign the value 3 to b
  c db 2                   ; Assign the value 2 to c
  resultMsg db 'Result: $' ; Assign the value 'Result: ' to resultMsg with a '$' placeholder for 

section .text
_start:
  mov al, [b]              ; Assign b to al
  sub al, [c]              ; Subtract c from al
  add al, [a]              ; Add a to al

  ; Turn the result into an ASCII symbol (single-digit value)
  add al, 30h              ; Convert al into an ASCII symbol

  ; Output the result
  mov ah, 09h              ; DOS function that returns a string
  lea dx, resultMsg        ; Set dx to be the output of resultMsg
  int 21h                  ; Calling a DOS-break

  ; Returning the number
  mov dl, al               ; Place the result in dl for output
  mov ah, 02h              ; DOS funtion to return a symbol
  int 21h                  ; Calling a DOS-break

  ; Ending the program
  mov ax, 4c00h            ; DOS function to end the program
  int 21h                  ; Calling a DOS-break