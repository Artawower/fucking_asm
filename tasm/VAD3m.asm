public equal_80
code segment
assume cs: code
equal_80 proc near

  push bp
  mov bp, sp
  mov si, [bp + 4]
  mov ax, [si]
  mov si, [bp + 6]
  mov bx, [si]
  add ax, bx
  cmp ax, 80d
  ja yep
  lea dx, nope
  jmp blink_point
  yep:
    lea dx, ye

  blink_point:
  pop bp
  ret 4
endp equal_80
code ends

data Segment public
ye       db 'Da', 13,10,'$'
nope      db 'Net', 13,10,'$'
data ends
end
