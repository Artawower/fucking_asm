code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  xor AH, AH
  mov AL, 6
  mov BL, 9
  mul BL ;ax = 36h
  AAM ; ax = 0504

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
