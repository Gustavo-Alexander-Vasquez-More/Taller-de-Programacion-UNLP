program ejercicio2;
type
  rango=100..200;
  lista=^nodo;
  nodo=record
    dato:rango;
    sig:lista;
  end;
procedure generarLista(var pri:lista; num:rango);
var
  nuevo:lista;
begin
  if(num <> 100) then begin
    new(nuevo); nuevo^.dato:=num; nuevo^.sig:=nil;
    if(pri = nil) then
      pri:=nuevo
    else begin
      nuevo^.sig:=pri;
      pri:=nuevo;
    end;
    num:=random(101) + 100;
    generarLista(pri, num);
  end;
end;
var
  pri:lista;
  num:rango;
begin
  randomize;
  pri:=nil;
  num:=random(101) + 100;
  generarLista(pri, num);
end.
