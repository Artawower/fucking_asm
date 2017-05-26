extrn min:near
public InputInt, OutputMsg
code segment public
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

OutputMsg proc near
; поместить строку в dx
mov ah, 9
int 21h
ret
OutputMsg endp


start:
  mov ax, data
  mov ds, ax
  mov dx, offset opt
  call OutputMsg
  call InputInt

  push ax
  mov dx, offset opt
  call OutputMsg
  call InputInt
  push ax
  call min
code ends

data Segment public
  str_number dq
  strdsc     db 6, 0
  strbuf     db 6 dup (?)
  opt       db 'VVOD CHISLA: ', 13,10,'$'
  min1       db 'MIN - 1', 13,10,'$'
  min2       db 'MIN - 2', 13,10,'$'
Result dw
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
