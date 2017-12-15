public eqv_with_minus_hundred
code segment public
assume cs: code


eqv_with_minus_hundred proc near
  push bp
  mov bp, sp
  mov ax, [bp + 4]
  cmp ax, -01000d
  jnge yes
  mov dx, offset Da
  jmp blink_to_end
  yes:
      mov dx, offset Net
  blink_to_end:
  pop bp
  ret 2
endp eqv_with_minus_hundred
code ends

data Segment public
Da       db 'Da', 13,10,'$'
Net       db 'Net', 13,10,'$'
data ends
end
