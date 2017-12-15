.model Large, PASCAL
.code
public find_first_symbol1
find_first_symbol1 proc near mystr:dword, str_length:word, find_el:byte,
xor bx, bx
xor ax, ax
xor dx, dx
mov cx, str_length
les si, mystr
mov dl, find_el
inc si

@main:
  mov al, byte ptr [es:si]
  inc si
  mov ah, 0
  cmp ax, dx
  je @m2
  loop @main
  mov cx, str_length
  inc cx
@m2:
  mov ax, str_length
  sub ax, cx
  ret
find_first_symbol1 endp
end
