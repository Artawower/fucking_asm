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
  mov dx, offset opt1

  call OutputMsg
  call InputInt

  mov tmp1, ax
  lea ax, tmp1
  push ax
  ; mov cx, ax
  mov dx, offset opt2
  call OutputMsg
  call InputInt

  mov tmp2, ax
  lea ax, tmp2
  push ax
  call min

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
  opt1       db 'Input first number: ', 13,10,'$'
  opt2       db 'Input second number: ', 13,10,'$'
Result dw
data ends

stek segment public
stack dw 128 dup (?)
stek ends
end Start
