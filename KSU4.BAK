function find_first_symbol(var mystr :string; str_length :integer; find_el:char): integer; near; assembler;
asm
  xor bx, bx
  xor ax, ax
  xor dx, dx
  mov cx, str_length
  les si, mystr
  mov dl, find_el
  inc si

 @main:
    mov al, byte ptr [es:si]
    inc si
    mov ah, 0
    cmp ax, dx
    je @m2
    loop @main
    mov cx, str_length
    inc cx
 @m2:
    mov ax, str_length
    sub ax, cx
end;
{$L KSU4_1.OBJ}
function find_first_symbol1(var mystr :string; str_length :integer; find_el:char): integer; near;
external;
{$L KSU4_2.OBJ}
function find_first_symbol2(var mystr :string; str_length :integer; find_el:char): integer; near;
external;




var
sd, count_neg :integer;
str :string;


begin
writeln('HELLO WORLD');
str := 'DSASDSriv';
writeln(find_first_symbol(str, Length(str), 'r' ));
writeln(find_first_symbol1(str, Length(str), 'r' ));
sd := find_first_symbol2(str, Length(str), 'r' );
writeln(sd);
{count_neg := find_neg(m, 10);
writeln(count_neg);

count_neg := find_neg1(m, 10);
writeln(count_neg);
count_neg := find_neg2(m, 10);
writeln(count_neg);}
end.
