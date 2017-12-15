public equal_100
code segment
assume cs: code
equal_100 proc near
  push bp
  mov bp, sp
  xor dx, dx
  xor ax, ax
  xor si, si
  mov si, [bp + 4]
  mov ax, [si]
  mov si, [bp + 6]
  mov bx, [si]
  
  add ax, bx
  cmp ax, 100d
  je yes
  mov dx, offset msg_nope
  jmp blink_point
  yes:
    mov dx, offset msg_yep

  blink_point:
  pop bp
  ret 4
endp equal_100
code ends

data Segment public
msg_yep       db 'Equal!', 13,10,'$'
msg_nope      db 'Not Equal!!1', 13,10,'$'
data ends

end
