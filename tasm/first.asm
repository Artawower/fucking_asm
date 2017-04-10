begin segment ; Сегмент кода программы
assume cs: begin, ds:dates, ss: komod
start:
mov ax, dates ; Настройка DS на начало сегмента данных
mov ds, ax
mov ah, 9 ; Функция 9 сервиса DOS:
mov dx, offset Msg ; вывод строки с указанного
int 21h ; в ds:dx адреса до символа '$'
mov ax, 4c00h ; Завершение программы с кодом 0
int 21h
begin ends
dates segment ; Сегмент данных
Msg db 'Hello! ', 13,10,'$'
dates ends

komod segment stack ; Сегмент стека
dw 128 dup (?) ; под стек отводится 128 слов
komod ends
end Start
