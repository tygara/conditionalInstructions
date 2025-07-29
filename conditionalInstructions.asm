section .text
  global _start 

section .bss
  odd resb 25
  lrg resb 3

section .data
; integers we will use in find largest block
  a db 5
  b db 100
  c db 30
  d db 50
  e db 17

_start:
  xor eax, eax          ; clear eax for use
  xor ebx, ebx          ; clear ebx as well, I use this later to hold index value
  xor edx, edx          ; clear edx which Ill use as index
  mov al, 1
  mov cl, 1
;------------------------------------------------------------------------------
;       Generate sequence of odds numbers from 1-20 & print to console
;------------------------------------------------------------------------------
sequence:
  mov al, cl
  xor ah, ah            ; clear register for division

hundreds_place:
  mov bl, 100           ; divisor
  div bl                ; ah:0 | al:1
  cmp al, 0             ; if quotient has zero, there is no hundreds digit
  je tens_place               ; jump to tens if no hundreds digit
  add al, '0'           ; convert to ascii representation
  mov [odd + edx], al   
  inc edx

tens_place:
  mov al, ah            
  xor ah, ah
  mov bl, 10
  div bl                
  test al, al
  jz ones_place


hasTen_place:
  add al, '0'
  mov byte [odd + edx], al
  inc edx

ones_place:
  add ah, '0'
  mov byte [odd + edx], ah 
  inc edx
  mov byte [odd + edx], 0x0A
  inc edx

  add cl, 2             ; increment to next odd number
  cmp cl, 19
  jle sequence


printSequence:
  mov   eax, 4          ; sys_write
  mov   ebx, 1          ; stdout
  mov   ecx, odd        ; address of data to write
  mov   edx, 25          ; number of btes to write
  int   0x80

; ------------------------------------------------------------------------------
;                             End odd sequence
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;                   Find largest integer among five integers
;-------------------------------------------------------------------------------
largest: 
  mov al, [a]
  cmp al, [b]
  jg next1
  mov al, [b] 

next1:
  cmp al, [c]
  jg next2
  mov al, [c]


next2:
  cmp al, [d]
  jg next3
  mov al, [d]

next3:
  cmp al, [e]
  jg conversion_
  mov al, [e]


conversion_:
  xor ah, ah
  xor edx, edx

hundreds:
  mov bl, 100
  div bl                ; ah:0 | al:1
  cmp al, 0
  je tens
  add al, '0'
  mov [lrg + edx], al
  inc edx

tens:
  mov al, ah            
  xor ah, ah
  mov bl, 10
  div bl                ; ah:0 | al: 0

  test al, al
  jnz hasTen

  test edx, edx
  jz ones

hasTen:
  add al, '0'
  mov [lrg + edx], al
  inc edx

ones:
  add ah, '0'
  mov [lrg + edx], ah
  inc edx


print:
  mov   eax, 4          ; sys_write
  mov   ebx, 1          ; stdout
  mov   ecx, lrg        ; address of data to write
  mov   edx, edx          ; number of bytes to write
  int   0x80

_exit:
  mov eax, 1           ; sys_exit
  xor ebx, ebx          ; status = 0
  int 0x80
