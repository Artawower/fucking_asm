code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  mov ax, [y]
  add ax, word ptr [z]

  mov cx, 0
  adc cx, 0
  add cx, word ptr [z+1]
  mov word ptr [z+1], cx

  sub ax, [x]
  sbb ax, 0
  mov dx, ax

  mov ax, 4c00h
  int 21h
code ends

data Segment
  x dd 120000d
  y dd 68000d
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
