code segment
assume cs: code, ds:data, ss: stek
start:
  mov ax, data
  mov ds, ax
  xor ah, ah
  mov al, 87h
  add al, 35h ; al = BCh
  DAA ;al=22 cf=af=1
  jnc $+4
  inc ah

  ; m1: 

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
