code segment byte public
assume cs: code
public find_neg2
find_neg2 proc near
  xor bx, bx
  push bp
  mov bp, sp

  mov cx, [bp + 4]
  les si, dword ptr [bp + 6]
  mov dh, 0

@main:
    mov dl, [es:si]
    inc si
    or dl,dl
    jns @m2
    inc bx
@m2:
    loop @main


    mov ax, bx
    mov bp, bx
    pop bp
    ret 8
find_neg2 endp
Code ends
end
