code segment
assume cs: code, ds:data, ss: stek
start:
mov ax, data
mov ds, ax
mov ax, 0
mov ax, word ptr [x]
sub ax, word ptr [y]
add ax, word ptr [z]
mov dx, ax
code ends

data Segment
x dw 100d
y dw 110d
z dd 230d
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
