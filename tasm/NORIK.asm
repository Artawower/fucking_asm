code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  ;располовинли число на 2 регистра
  mov ax, word ptr [x]
  mov bx, word ptr [y]
  mov cx, word ptr [z]
  mov dx, word ptr [z+2]

  add ax, bx
  adc dx, 0
  add cx, ax
  adc dx, 0

  mov ax, 4c00h
  int 21h
code ends

data Segment
  x     dw 4000d
  y     dw 20000d
  z     dd 500000d
  odved dd (?)
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
