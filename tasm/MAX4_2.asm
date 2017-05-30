code segment byte public
assume cs: code
public find_neg2
find_neg2 proc near
push bp
mov bp, sp
xor bx, bx
xor ax, ax
xor dx, dx
mov cx, word ptr [bp+4]
mov dx, word ptr [bp+6]
sub dx, word ptr [bp+4]
add dx, dx
les si, dword ptr [bp+8]
add si, dx

@main:
  mov bx, word ptr [es:si]
  inc si
  inc si
  cmp bx, 0
  jnl @m2
  add ax, bx
@m2:
  loop @main
  pop bp
  ret 8
find_neg2 endp
Code ends
end
