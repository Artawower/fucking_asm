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

; min proc near
;   push bp
;   mov bp, sp
;   mov si, [bp + 4]
;   mov ax, [si]
;   mov si, [bp + 6]
;   mov cx, [si]
;
;   sub ax, cx
;   jns bg2
;   js bg1
; min  endp

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


; bg1:
;     mov dx, offset min1
;     mov ah, 9
;     int 21h
;     mov ax, 4c00h
;     int 21h
; bg2:
;     mov dx, offset min2
;     mov ah, 9
;     int 21h
;     mov ax, 4c00h
;     int 21h
code ends

data Segment public
  str_number dq
  x          dw 100d
  y          dw 110d
  z          dd 230d
  tmp1       dw (?)
  tmp2       dw (?)
  strdsc     db 6, 0
  strbuf     db 6 dup (?)
  opt1       db 'Input first number: ', 13,10,'$'
  opt2       db 'Input second number: ', 13,10,'$'
  min1       db 'The first number bigger then two', 13,10,'$'
  min2       db 'The second number bigger then one', 13,10,'$'
Result dw
data ends

stek segment public
stack dw 128 dup (?)
stek ends
end Start