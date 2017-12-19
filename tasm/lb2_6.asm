code segment
assume cs: code, ds: data, ss: stek
start:
  mov ax, data
  mov ds, ax
  mov ax, 0
  mov bx, 0
  mov al, byte ptr [y]
  mov bl, byte ptr [x]
  mov cx, [z]

  add cx, ax
  sub cx, bx
    
  mov ax, 4c00h
  int 21h
code ends

data Segment
  x db 240d
  y db 120d
  z dw 300d
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start