{Escribir un procedimiento recursivo que reciba un número entero N y escriba los números del 1 al N.}
program ejercicio1;
procedure contarHastaN(n:integer);
begin
  if(n > 0)then begin
    contarHastaN(n - 1); //primero apila el N, al hacer la primera llamada recursiva apila n-1 y asi hasta que n sea 0 que no se apila y detiene la recursion.
    writeln(n); //una vez lledo al caso base writeln imprime desapilando el valor de n osea el ultimo en apilar lo imprime y desapila hasta llegar al primer elemento de la pila
  end;
end;
var
  n:integer;
begin
  writeln('Escribe un numero mayor a 0');
  readln(n);
  contarHastaN(n);
end.
