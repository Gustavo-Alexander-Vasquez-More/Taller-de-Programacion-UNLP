{Escribir un procedimiento recursivo que reciba un número entero N y lo imprima en binario.}
program ejercicio4;
procedure convertirBinario(n:integer);
var
  resto:integer;
begin
  if(n <> 0) then begin
    convertirBinario(n DIV 2);
    resto:=n MOD 2;
    write(resto);
  end;
end;
var
  n:integer;
begin
  writeln('Ingrese un numero mayor a 0');
  readln(n);
  write('La conversion de ', n, ' a binario es: ');
  convertirBinario(n);
end.
