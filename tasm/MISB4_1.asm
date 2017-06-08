.model Large, PASCAL
.code
public counting_elem1
counting_elem1 proc near ThisMas:dword, length_mas:word, elem:word
mov dx, elem
mov cx, length_mas
les si, ThisMas
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
ret
counting_elem1 endp
end
