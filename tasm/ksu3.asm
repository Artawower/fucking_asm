extrn equal_100:near
public InputInt, print
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

start:
  mov ax, data
  mov ds, ax
  lea dx, vvedi
  call print
  call InputInt

  mov tmp1, ax
  lea ax, tmp1
  push ax

  lea dx, vvedi
  call print
  call InputInt

  mov tmp2, ax
  lea ax, tmp2
  push ax

  call equal_100

  call print
  mov ax, 4c00h
  int 21h


code ends

data Segment public
  strdsc         db 6, 0
  strbuf         db 6 dup (?)
  const_thousend dw 3E8h
  tmp1            dw (?)
  tmp2            dw (?)
  vvedi          db 'chislo dlya x+y == 100?: ', 13,10,'$'
Result dw
data ends

stek segment public stack
dw 128 dup (?)
stek ends
end Start
end
