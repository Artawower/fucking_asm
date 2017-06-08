  type mas = array [0..9] of integer;
  function find_neg(var ThisMas :mas; length_mas :integer; elem:integer): integer; near; assembler;
  asm
    mov dx, elem
    mov cx, length_mas
    les si, ThisMas
    mov bx, 0

   @main:
      mov ax, [es:si]
      cmp ax, dx
      je m2


    @m2:
      inc bx
      loop @main
    dex bx
    mov ax, bx
  end;
  {$L PASCAL1.OBJ}
  function find_neg2(var ThisMas :mas; length_mas :integer): integer; near;
  external;
  {$L PASCAL.OBJ}
  function find_neg1(var ThisMas :mas; length_mas :integer): integer; near;
  external;



  const m : mas = ($5, -$2, $4, -$10, $12, $3, $6, -$2, -$10, -$2);
  var
  count_neg :integer;
  begin
  writeln('HELLO WORLD');
  count_neg := find_neg(m, 10);
  writeln(count_neg);

  count_neg := find_neg1(m, 10);
  writeln(count_neg);
  count_neg := find_neg2(m, 10);
  writeln(count_neg);
  end.
