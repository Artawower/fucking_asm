code segment
assume cs: code, ds:data, ss: stek
start:
mov ax, data
mov ds, ax
mov ax, word ptr [x]
sub ax, word ptr [y]
add ax, word ptr [z]
mov dx, ax

; hello db 'Hello!$'
; mov ah, 9
; mov dx,OFFSET hello
; int 21h
; mov ax, 4c00h
; int 21h


code ends
data Segment
x dd 100d
y dd 110d
z dw 210d
Result dw

; Msg db 13,10,'Enter:'
; Chr db '0 ', '$'
data ends
stek segment stack
dw 128 dup (?)
stek ends
end Start
