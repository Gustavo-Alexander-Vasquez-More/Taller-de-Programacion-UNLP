//Ejercicio introductorio
program actividad1;
procedure generarAleatorio();
begin
  writeln(random(100));
end;
procedure generarNaleatorios(n, a, b:integer);
var i:integer;
begin
  for i:=1 to n do
    writeln(random(b - a + 1) + a);
end;
procedure incisoE(a, b, f:integer);
var 
  sigue:boolean;
  num:integer;
begin
  sigue:=true;
  while(sigue) do begin
    num:=random(b - a + 1) + a;
    if(num <> f) then
      writeln(num)
    else
      sigue:=false;
  end;
end;
var n, a, b, f, i:integer;
begin
  randomize;
  for i:=1 to 20 do
    generarAleatorio();
  writeln('Ingrese la cantidad de veces que quiere generar de numeros random: '); readln(n);
  writeln('Ingrese el numero de rango inferior: '); readln(a);
  writeln('Ingrese el numero de rango superior: '); readln(b);
  generarNaleatorios(n, a, b);
  writeln('Ingrese el numero F: '); readln(f);
  incisoE(a, b, f);
end.
 
