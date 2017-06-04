public equal_100
code segment
assume cs: code
equal_100 proc near
  ;результат возвращается в dx
  ;портит cx, si, dx
  push bp
  mov bp, sp
  mov ax, [bp + 4]
  mov bx, [bp + 6]
  add ax, bx
  cmp ax, 80d
  je yep
  mov dx, nope
  jmp blink_point
  yep:
    mov dx, yep

  blink_point:
  pop bp
  ret 4
endp equal
code ends

data Segment public
yep       db 'Equal!', 13,10,'$'
nope      db 'Not Equal!!1', 13,10,'$'
data ends
end
