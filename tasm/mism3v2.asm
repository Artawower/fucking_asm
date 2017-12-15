public equal_with_0
code segment public
assume cs: code
equal_with_0 proc near
  ;результат возвращается в dx
  ;портит cx, si, dx
  xor ax, ax
  push bp
  mov bp, sp
  mov si, [bp + 4]
  mov ax, [si]

  cmp ax, 0
  je ye
  lea dx, net
  jmp next
ye:
  lea dx, da
next:
  pop bp
  ret 4
endp equal_with_0
code ends

data Segment public
da             db 'da', 13,10,'$'
net            db 'net', 13,10,'$'
data ends
end
