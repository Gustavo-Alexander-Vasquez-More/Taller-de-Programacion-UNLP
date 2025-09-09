{Hacer lo mismo que el anterior pero en orden descendente.}
program ejercicio2;
procedure imprimirDescendente(n:integer);
begin
  if(n > 0)then begin
    writeln(n); //imprime lo que se pase por parametro
    imprimirDescendente(n - 1); //luego vuelve a llamar pero esta vez decrementado
  end;
end;
var 
  n:integer;
begin
  writeln('Escriba un numero mayor a 0');
  readln(n);
  imprimirDescendente(n);
end.
