code segment byte public
assume cs: code
public find_max2
find_max2 proc near
push bp
mov bp, sp

xor bx, bx
xor ax, ax
xor dx, dx
mov cx, word ptr [bp+4]
les si, dword ptr [bp+6]

mov al, byte ptr [es:si]
@main:
  mov bl, byte ptr[es:si]
  inc si
  cmp ax, bx
  jnb @m2
  mov ax, bx
@m2:
  loop @main
  pop bp
  ret 6
find_max2 endp
Code ends
end
