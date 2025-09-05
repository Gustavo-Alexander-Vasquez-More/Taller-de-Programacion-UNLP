program ejercicio3;
const dimF=20;
type
  rango=300..1550;
  vector=array[1..dimF] of integer;
{a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}
procedure generarVector(var v:vector; var dimL:integer);
var
  num:rango;
begin
  num:=random(1550 - 300 + 1) + 300;
  if(dimL = 0) then begin
    dimL:=dimL + 1;
    v[dimL]:=num;
  end
  else if(dimL > 0 AND dimL < dimF)begin
    dimL:=dimL + 1;
    v[dimL]:=num;
    generarVector(v, dimL);
  end;
end;
var
  v:vector;
  dimL:integer;
begin
  randomize;
  dimL:=0;
  generarVector(v, dimL);
end.
