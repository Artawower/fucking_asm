  type mas = array [0..9] of integer;
  function find_neg(var ThisMas :mas; length_mas :integer; k :integer): integer; near; assembler;
  asm
    xor bx, bx
    xor ax, ax
    xor dx, dx
    mov cx, k
    mov dx, length_mas
    sub dx, k
    add dx, dx
    les si, ThisMas
    add si, dx

    @main:
      mov bx, word ptr [es:si]
      inc si
      inc si
      cmp bx, 0
      jnl @m2
      add ax, bx
    @m2:
      loop @main
  end;

  {$L MAX4_1.OBJ}
  function find_neg1(var ThisMas :mas; length_mas :integer; k :integer): integer; near;
  external;
  {$L MAX4_2.OBJ}
  function find_neg2(var ThisMas :mas; length_mas :integer; k :integer): integer; near;
  external;

  const m : mas = (-5, -2, 4, 10, 12, 3, 6, -12, -10, 2);
  var
  count_neg :integer;
  begin
  count_neg := find_neg(m, 10, 6);
  writeln(count_neg);
  count_neg := find_neg1(m, 10, 6);
  writeln(count_neg);
  count_neg := find_neg2(m, 10, 6);
  writeln(count_neg);
  end.
