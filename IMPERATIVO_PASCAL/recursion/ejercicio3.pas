program ejercicio3;
const dimF=20;
type
  indice=integer;
  rango=300..1550;
  vector=array[1..dimF] of integer;
{a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}
procedure generarVector(var v:vector; var dimL:integer);
var
  num:rango;
begin
  if(dimL < dimF) then begin
    num:=random(1550 - 300 + 1) + 300;
    dimL:=dimL + 1;
    v[dimL]:=num;
    generarVector(v, dimL);
  end;
end;
procedure ordenarInsercion(var v:vector; dimL:integer);
var
  i,j, actual:integer;
begin
  for i:=2 to dimL do begin
    actual:=v[i];
    j:=i-1;
    while((j > 0) AND (v[j] > actual)) do begin
      //vamos a hacer un corrimiento hacia la derecha
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=actual; //insertamos el elemento donde hicimos el espacio
  end;
end;
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var medio:indice;
begin
  pos:=-1;
  medio:=(ini + fin) DIV 2;
  while((ini <= fin) AND (v[medio] <> dato)) do begin
    if(dato < v[medio])then //si el dato que buscamos es menor al medio entonces buscamos a la izquierda
      fin:=medio - 1
    else // si es mayor buscamos a la derecha
      ini:=medio + 1;
    medio:=(ini + fin) DIV 2;
  end;
  if((ini <= fin) AND (v[medio] = dato)) then
    pos:=medio;
end;
//VARIABLES LOCALES DEL PROGRAMA
var
  v:vector;
  dimL, dato:integer;
  pos, ini, fin:indice;
begin
  randomize;
  dimL:=0;
  generarVector(v, dimL);
  ordenarInsercion(v, dimL);
  writeln('Ingrese un numero'); readln(dato);
  ini:=1;
  fin:=dimL;
  busquedaDicotomica(v, ini, fin, dato, pos);
  writeln(pos);
end.
