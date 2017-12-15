code segment
assume cs: code, ds:data, ss: stek
start: mov ax, data
mov ds, ax
mov ax,word ptr [X] ; первая часть
mov bx,[Y]
add ax,bx
mov [Result],ax
mov ax,[Y+2]
adc ax,word ptr [X+2]
mov [Result+2],ax
mov ah,1 ; вторая часть
int 21h
mov [Chr],al
mov ah, 9
mov dx, offset Msg
int 21h
mov ax, 4c00h
int 21h
code ends
data Segment
X dd 123456h ; число 123456h
Y dw 0FF88h,0077h ; число 77FF88h
Result dw 0,0 ; результат
Msg db 13,10,'Enter:'
Chr db '0', '$'
data ends
stek segment stack
dw 128 dup (?)
stek ends
end Start
