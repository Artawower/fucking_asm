public or2
code segment public
assume cs: code
or2 proc near
  push bp
  mov bp, sp
  mov ax, [bp+4]
  mov bx, [bp+6]
  or ax, bx
  cmp ax, 0
  je eqv
  lea dx, nope
  jmp back
eqv:
  lea dx, yep

back:
  pop bp
  ret 4
endp or2
code ends

data Segment public
yep       db 'Da', 13,10,'$'
nope      db 'Net', 13,10,'$'
data ends
end
