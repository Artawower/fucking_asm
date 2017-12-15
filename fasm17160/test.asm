use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h

    mov al,[a]      ;Загружаем значение a в AL
    mov ah,[b]      ;Загружаем значение b в AH
    add ah,[c]      ;AH = AH + c = b+c
    dec ah          ;AH = AH - 1 = b+c-1
    sub al,ah       ;AL = AL - AH = a-(b+c-1)
    mov cl,[d]      ;CL = d
    neg cl          ;CL = -CL = -d
    add al,cl       ;AL = AL + CL = a-(b+c-1)+(-d)
    mov [e],al      ;Сохраняем результат в e

    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
a db 2
b db 3
c db 5
d db -8
e db ?
