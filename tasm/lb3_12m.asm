extrn eqv_with_minus_hundred:near
public vvod_chisla
code segment public

assume cs: code, ds:data, ss: stek
vvod_chisla proc near
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
vvod_chisla  endp


start:
  mov ax, data
  mov ds, ax
  mov dx, offset vvod
  mov ah, 9
  int 21h

  call vvod_chisla
  push ax
  call eqv_with_minus_hundred

  mov ah, 9
  int 21h
  mov ax, 4c00h
  int 21h
code ends

data Segment public
  str_number dq
  tmp1       dw (?)
  tmp2       dw (?)
  strdsc     db 6, 0
  strbuf     db 6 dup (?)
  vvod       db 'vvod 4isla: ', 13,10,'$'
Result dw
data ends

stek segment public stack
dw 128 dup (?)
stek ends
end Start
