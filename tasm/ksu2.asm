code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  mov ax, [y]
  mov dx, [z]
  add ax, dx
  mov ch, 0
  mov cl, byte ptr [x]
  sbb ax, cx

  mov ax, 4c00h
  int 21h
code ends

data Segment
  x db 50d
  y dw 624d
  z dw 301d
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
