code segment
assume cs: code, ds: data, ss: stek
start:
  mov ax, data
  mov ds, ax
  ; z(dd) + y(db) - x(db)
  mov ax, 0
  mov al, byte ptr [y]
  mov bx, word ptr [z+2]
  mov dx, word ptr [z]

  add bx, ax
  adc dx, 0

  mov ax, 0
  mov al, byte ptr [x]
  sub bx, ax
  sbb dx, 0

  mov word ptr [result+1], bx
  mov word ptr [result], dx

  mov ax, 4c00h
  int 21h
code ends

data Segment
x db 80d
y db 200d
z dd 400d
result dd (?)
data ends

stek segment stack
dw 128 dup (?)
stek ends
end start
