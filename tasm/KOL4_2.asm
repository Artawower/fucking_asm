code segment byte public
assume cs: code
public find_max_elem_hand
find_max_elem_hand proc near
push bp
mov bp, sp
  mov cx, word ptr [bp + 4]
  les si, dword ptr [bp + 6]
  mov al, byte ptr [es:si]

  @main:
    mov bl, byte ptr[es:si]
    inc si
    cmp al, bl
    jg @m2
    mov al, bl
  @m2:
    loop @main
  pop bp
  ret 6
find_max_elem_hand endp
Code ends
end
