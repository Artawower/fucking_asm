.model Large, PASCAL
.code
public find_neg1
find_neg1 proc near ThisMas:dword, length_mas:word, k:word
@met:
xor bx, bx
xor ax, ax
xor dx, dx
mov cx, k
mov dx, length_mas
sub dx, k
add dx, dx
les si, ThisMas
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
  ret
find_neg1 endp
end
