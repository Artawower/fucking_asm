{ поиск максимального значения в массиве слов без знака}
  type mas = array [0..9] of word;
  function find_max(var massiv :mas; length_mas :integer): integer; near; assembler;
  asm
    mov cx, length_mas
    les si, massiv
    xor bx, bx
    xor ax, ax
    mov al, byte ptr [es:si]

    @main:
      mov bl, byte ptr[es:si]
      inc si
      cmp ax, bx
      jnb @m2
      mov ax, bx
    @m2:
      loop @main




  end;


  const m : mas = (5, 2, 22, 10, 12, 3, 6, 2, 10, 2);
  var
  max_elem :integer;
  begin
  max_elem := find_max(m, 10);
  writeln(max_elem);

  {count_neg := find_neg1(m, 10);
  writeln(count_neg);
  count_neg := find_neg2(m, 10);
  writeln(count_neg);}
  end.
