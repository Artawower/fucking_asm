.model Large, PASCAL
.code
public find_max_elem_LP
find_max_elem_LP proc near massiv:dword, length_mas:word
mov cx, length_mas
les si, massiv
mov al, byte ptr [es:si]

@main:
  mov bl, byte ptr[es:si]
  inc si
  cmp al, bl
  jg @m2
  mov al, bl
@m2:
  loop @main
  ret
find_max_elem_LP endp
end
