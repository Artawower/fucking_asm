public neg_check
code segment public
assume cs: code

neg_check proc near
  push bp
  mov bp, sp
  mov si, [bp + 4]
  mov dx, si
  cmp dx, 45d
  je eqv
  mov dx, offset f
  jmp blink_to_end
  eqv:
      mov dx, offset t
  blink_to_end:
  pop bp
  ret 2
endp neg_check
code ends

data Segment public
t       db 'chislo otricatelnoe', 13,10,'$'
f       db 'chislo poloshitelnoe', 13,10,'$'
data ends
end
