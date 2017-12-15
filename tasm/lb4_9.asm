code segment
assume cs: code, ds: data, ss: stek
start:
  mov ax, data
  mov ds, ax
  mov es:di, offset stroka
  check_space:
    mov al, byte ptr[di]
    inc cx
    cmp al, 32d ;sapce ASCII code
    jne to_end
    inc di
    jmp check_space
  to_end:
    mov dx, di
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h
code ends

data Segment
stroka       db '      stroka s nachalnimi probelami', 13,10,'$'
data ends

stek segment stack
dw 128 dup (?)
stek ends
end Start
