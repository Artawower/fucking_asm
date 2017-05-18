.model Large PASCAL
.CODE
public find_neg1
find_neg1 proc near ThisMas:dword, length_mas:word
@main:
  push bp
  mov bp, sp

  xor cx, cx
  mov cx, length_mas
  les si, ThisMas
  xor bx, bx
  xor ax, ax
  mov bx, length_mas
    ; mov ah, 0
    ; mov al, byte ptr [es:si]
  ;   inc si
  ;   or al,al
  ;   jns @m2
  ;   inc bx
  ; @m2:
  ;   loop @main
  xor bx, bx
  xor dx, dx
  mov ax, length_mas
  ; mov ax, length_mas
  ret
find_neg1 endp
end
