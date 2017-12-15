code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  ;располовинли число на 2 регистра
  mov ax, word ptr [x]
  mov bx, word ptr [x+2]
  mov cx, word ptr [y]
  mov dx, word ptr [y+2]

  sub bx, dx
  sbb ax, cx

  mov word ptr [odved], ax
  mov word ptr [odved+2], bx

  mov ax, 4c00h
  int 21h
code ends

data Segment
  x     dd 4000d
  y     dd 200080d
  odved dd (?)
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
