public eqv_with_hundred
code segment public
assume cs: code

eqv_with_hundred proc near
  ; cmp val in dx
  ; result str in dx
  ; push bp
  ; mov bp, sp
  ; mov ax, [bp + 4]
  mov ax, es:[si]
  cmp ax, 1000d
  jna no
  mov dx, offset Da
  jmp blink_to_end
  no:
      mov dx, offset Net
  blink_to_end:
  ret
endp eqv_with_hundred
code ends

data Segment public
Da       db 'Da', 13,10,'$'
Net       db 'Net', 13,10,'$'
data ends
end
