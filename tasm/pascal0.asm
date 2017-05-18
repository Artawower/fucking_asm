public find_neg1
model large pascal
code segment public
assume cs: code

find_neg1 proc near ThisMas:dword, length_mas:word
@main:
  mov cx, length_mas
  les si, ThisMas
  xor bx, bx
  xor ax, ax
  mov al, byte ptr [es:si]
  inc si
    ; cmp al,0
  or al,al
  jns @m2
  inc bx
  @m2:
    loop @main
  mov ax, bx
  ret

find_neg1 endp
code ends
end
