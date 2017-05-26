code segment byte public
assume cs: code
public max2
max2 proc near
  push bp
  mov bp, sp

  @met:
  les si , dword ptr [bp+8]
  mov dx , [bp+4]
  add si , dx

  mov cx, [bp+6]
  mov ax, word ptr [es:si]

  @func:
  mov bx, word ptr [es:si]
  cmp bx, ax
  jna @again

  mov ax, bx

  @again:
  inc si
  inc si
  loop @func
  pop bp
  ret 8
max2 endp
Code ends
end
