public OutputInt
code segment
assume cs: code, es:data, ss: stek
OutputInt proc near
     push ax
     push bx
     push cx
     push dx
     mov bx, 10
     xor cx,cx
     n1:
     xor dx,dx
     div bx
     inc cx
     push dx
     or ax,ax
     jnz n1
     mov bx,offset strbuf
n2:
    pop dx
     add dl,30h
     mov [bx],dl
     inc bx
     loop n2
     mov byte ptr [bx],'$'
     mov dx,offset strbuf
     mov ah,9
     int 21h
     pop dx
     pop cx
     pop bx
     pop ax
     ret
     endp OutputInt
start:
  mov ax, data
  mov ds, ax
  mov es, ax

  xor dx, dx
  mov cx, 8
  lea di, es:[massiv]
  xor bx, bx
  mov ax, 11d

  cld

  m1:
    scasw
    jne bli
    inc bx
  bli:
    loop m1
    mov ax, bx
  call OutputInt
  mov dx,offset strend
  mov ah,9
  int 21h

  mov ax, 4c00h
  int 21h
code ends

data Segment
  massiv dw 11d, 11d, 66d, 665d, 66d, 344d, 266d, 5221d
  strdsc db 6,0
  strbuf db 6 dup (?)
  strend  db 13,10,'$'
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
