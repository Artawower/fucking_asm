public min
code segment
assume cs: code
min proc near
  ;результат возвращается в dx
  ;портит cx, si, dx
  xor dx, dx
  push bp
  mov bp, sp
  mov si, [bp + 4]
  mov ax, [si]
  mov si, [bp + 6]
  mov cx, [si]

  cmp ax, cx
  jg bg2
  mov dx, offset min1
  jmp min_end
  bg2:
      mov dx, offset min2

  min_end:
  pop bp
  ret 4
endp min
code ends

data Segment public
min1       db 'The first number bigger then two', 13,10,'$'
min2       db 'The second number bigger then one', 13,10,'$'
data ends
end
