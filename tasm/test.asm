code segment
assume cs: code, ds:data, ss: stek
start:
mov ax, data
mov ds, ax
mov ax, 0
mov ax, 10d
sub ax, 5d
add ax, 100d
mov dx, ax

hello db 'Hello!$'
mov ah, 9
mov dx,OFFSET hello
int 21h
mov ax, 4c00h
int 21h
code ends

data Segment
x dd 24d
y dd 1d
z dw 40d
Result dw

; Msg db 13,10,'Enter:'
; Chr db '0 ', '$'
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
