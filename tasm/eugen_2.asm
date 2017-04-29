code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  mov ax, word ptr [x]
  add ax, word ptr [y]
  add ax, word ptr [z]
  mov dx, ax

  mov ax, 4c00h
  int 21h
code ends

data Segment
  x dd 20d
  y dd 980d
  z dd 10d
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
