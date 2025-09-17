program ejercicio3;
const dimF=20;
type
  rango=300..1550;
  vector=array[1..dimF] of rango;
{a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}
procedure cargarVector(var v:vector; var dimL:integer);
var num:integer;
begin
  num:=random(1550 - 300 + 1) + 300;
  if(dimL < dimF) then begin
    dimL:= dimL + 1;
    v[dimL]:=num;
    cargarVector(v, dimL);
  end;
end;
{b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)}
procedure ordenarInsercion(var v:vector; dimL:integer);
var i, j, actual:integer;  //actual representara al dato en el vector
begin
  for i:=2 to dimL do begin
    actual:=v[i]; //numero a comparar
    j:=i-1;
    while((j > 0) AND (v[j] > actual)) do begin //mientras el dato actual sea menor que el dato anterior hacemos corrimiento
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=actual;
  end;
end;
{c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado. Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}
Procedure busquedaDicotomica (v: vector; ini,fin:integer ; dato:integer; var pos:integer);
var
  medio:integer;
begin
  pos:=-1;
  medio:=(ini + fin) DIV 2;
  while((ini <=fin) AND (v[medio] <> dato)) do begin
    if(dato < v[medio])then begin //buscamos por la izquierda
      fin:=medio -1;
    end
    else
      ini:=medio + 1;
    medio:=(ini + fin) DIV 2;
  end;
  if((ini <= fin) AND (v[medio] = dato))then
    pos:=medio;
end;
var
 v:vector;
 dimL, ini, fin, dato, pos:integer;
begin
  randomize;
  ini:=1;
  fin:=20;
  dimL:=0;
  cargarVector(v, dimL);
  ordenarInsercion(v, dimL);
  writeln('Ingrese un numero'); readln(dato);
  busquedaDicotomica(v, ini, fin, dato, pos);
  if(pos = -1 ) then
    writeln('No se encontro el dato buscado en el arreglo')
  else
    writeln('El dato si se encontró');
end.
