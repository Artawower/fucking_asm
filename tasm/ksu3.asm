public InputInt, print, equal_100
code segment
assume cs: code, ds:data, ss: stek

InputInt proc near
  ;вывод в ax
  push bx
  push cx
  push dx
  push si
  mov dx,offset strdsc
  mov ah,0Ah
  int 21h
  mov dl,0Ah
  mov ah,2
  int 21h
  xor ax,ax
  xor cx,cx
  mov cl,[strdsc+1]
  mov si,offset strbuf
  mov bx,10
s1:
  mul bx
  mov dl,[si]
  inc si
  sub dl,30h
  add ax,dx
  loop s1
  pop si
  pop dx
  pop cx
  pop bx
  ret
InputInt  endp

print proc near
; поместить строку в dx
mov ah, 9
int 21h
ret
print endp

equal_100 proc near
; inc sp
; inc sp
; pop bx
; pop ax
push bp
mov bp, sp
mov ax, [bp + 4]
mov bx, [bp + 6]
add ax, bx
cmp ax, 100d
je yep
jne nope
pop bp ;все что тут
ret    ; никогда не сработает :(
equal_100 endp

start:
  mov ax, data
  mov ds, ax
  lea dx, vvedi
  call print
  call InputInt
  push ax
  lea dx, vvedi
  call print
  call InputInt
  push ax
  call equal_100
yep:
    lea dx, da
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h
nope:
    lea dx, net
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h


code ends

data Segment
  strdsc         db 6, 0
  strbuf         db 6 dup (?)
  const_thousend dw 3E8h
  vvedi          db 'chislo dlya x+y == 100?: ', 13,10,'$'
  da             db 'da', 13,10,'$'
  net            db 'net', 13,10,'$'
Result dw
data ends

stek segment stack
  dw 128 dup (?)
stek ends
end Start
