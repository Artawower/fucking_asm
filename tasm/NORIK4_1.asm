.model Large, PASCAL
.code
public find_max1
find_max1 proc near massiv:dword, length:word
xor bx, bx
xor ax, ax
xor dx, dx
mov cx, length
les si, massiv

mov al, byte ptr [es:si]
@main:
  mov bl, byte ptr[es:si]
  inc si
  cmp ax, bx
  jnb @m2
  mov ax, bx
@m2:
  loop @main
  ret
find_max1 endp
end
