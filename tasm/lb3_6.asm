extrn neg_check:near
code segment
assume cs: code, ds:data, ss: stek

start:
  mov ax, data
  mov ds, ax
  
  mov dx, offset vvod
  mov ah, 9
  int 21h

  mov dx,offset strdsc
  mov ah,0Ah
  int 21h
  mov dl,0Ah
  mov ah,2
  int 21h
  xor cx,cx
  mov cl,[strdsc+1]
  mov si,offset strbuf

  ; xor dx, dx
  mov dl, [si]

  push dx
  call neg_check
  mov ah, 9
  int 21h
  mov ax, 4c00h
  int 21h
code ends

data Segment public
  strdsc     db 6, 0
  strbuf     db 6 dup (?)
  vvod       db 'VVOD CHISLA: ', 13,10,'$'
data ends

stek segment public stack
dw 256 dup (?)
stek ends
end Start
