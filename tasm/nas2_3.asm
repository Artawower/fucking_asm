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

  add ax, bx
  add cx, ax
  adc dx, 0

  mov word ptr [Result], cx
  mov word ptr [Result + 2], dx
  mov ax, 4c00h
  int 21h
code ends

data Segment
  x db 240d
  y db 120d
  z dw 600d
Result dd(?)
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
