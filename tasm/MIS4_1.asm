.model Large, PASCAL
.code
public max1
max1 proc near x:dword, n:word, k:word
@met:
les si ,x
mov dx ,k
add si ,dx

mov cx, n
mov ax, word ptr [es:si]

@func:
mov bx, word ptr [es:si]
cmp bx, ax
jna @again

mov ax, bx

@again:
inc si
inc si
loop @func
ret
max1 endp
end
