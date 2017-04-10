code segment
assume cs: code, ds:data, ss: stek

input proc near
  ;записывает в dx
  mov ah, 0Ah
  LEA bx, str_number
  mov [bx], 6
  mov dx, bx
  int 21h
  ; mov cx, dx

  mov dl, 172
  mov ah, 09h
  int 21h
  ret

start:
  mov ax, data
  mov ds, ax
  call input

  mov ax, 4c00h
  int 21h
code ends

data Segment
  str_number dq
  x          dw 100d
  y          dw 110d
  z          dd 230d
Result dw
data ends

stek segment stack
  dw 128 dup (?)
stek ends
end Start
