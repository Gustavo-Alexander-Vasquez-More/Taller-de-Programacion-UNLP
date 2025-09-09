{Escribir una función recursiva que calcule la suma de los dígitos de un número entero positivo.}
program ejercicio3;
function calcularSuma(n:integer):integer;
begin
  if(n DIV 10 = 0) then {cuando tengo que parar? (caso base)}
    calcularSuma:=n
  else
    calcularSuma:=(n MOD 10) + calcularSuma(n DIV 10);
end;
var
  n:integer;
begin
  writeln('Escriba un numero mayo a 0');
  readln(n);
  writeln('La suma de los digitos de ', n, ' es ', calcularSuma(n));
end.
