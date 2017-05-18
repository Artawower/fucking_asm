.model Large, PASCAL
.code
public find_neg1
find_neg1 proc near ThisMas:dword, length_mas:word
  mov cx, length_mas
  xor bx, bx
  les si, ThisMas
  mov ah, 0
@main:
    mov al, byte ptr [es:si]
    inc si
    or al,al
    jns @m2
    inc bx
@m2:
    loop @main

  mov ax, bx
  ret
find_neg1 endp
end
