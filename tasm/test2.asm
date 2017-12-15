extrn InputInt:near, OutputInt:near
code segment public
assume cs:code, ds:data, ss: stek
start:
  mov ax,data
  mov ds,ax
  call InputInt
  call OutputInt
  mov dx,offset strend
  mov ah,9
  int 21h
  mov ax,4c00h
  int 21h
code ends

data segment public
strend db 13,10,'$'
data ends

Stek segment stack
dw 128 dup (?)
Stek ends
end start
