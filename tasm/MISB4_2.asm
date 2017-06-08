code segment byte public
assume cs: code
public counting_elem2
counting_elem2 proc near
push bp
mov bp, sp

mov dx, [bp+4]
mov cx, [bp+6]
les si, dword ptr [bp+8]
mov bx, 0

@main:
  mov ax, [es:si]
  add si, 2
  cmp ax, dx
  jne @m2
  inc bx
@m2:
  loop @main
mov ax, bx
pop bp
ret 8
counting_elem2 endp
Code ends
end
