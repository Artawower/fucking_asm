code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  ;37/9
  mov AX, 0307h
  mov BL, 9
  AAD ; AX=25H
  div BL ; AX=0104h

  m1:

  mov ax, 4c00h
  int 21h
code ends

data Segment
  x dw 100d
  y dw 3000d
  z dd 7100d
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
