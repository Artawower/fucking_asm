code segment byte public
assume cs: code
public find_first_symbol2
find_first_symbol2 proc near
push bp
mov bp, sp
xor bx, bx
xor dx, dx
mov cx, word ptr [bp+6]
les si, dword ptr [bp+8]
mov dl, byte ptr [bp+4]
inc si

@main:
  mov al, byte ptr [es:si]
  inc si
  mov ah, 0
  cmp ax, dx
  je @m2
  loop @main
  mov cx, word ptr [bp+6]
  inc cx
@m2:
  mov ax, word ptr [bp+6]
  sub ax, cx
  pop bp
  ret 8
find_first_symbol2 endp
Code ends
end
