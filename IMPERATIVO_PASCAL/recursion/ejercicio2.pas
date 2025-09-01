program ejercicio2;
type
  rango=100..200;
  lista=^nodo;
  nodo=record
    dato:rango;
    sig:lista;
  end;
procedure agregarAdelante(var pri:lista; nuevo:lista);
begin
  if(pri=nil) then
    pri:=nuevo
  else begin
    nuevo^.sig:=pri;
    pri:=nuevo;
  end;
end;
procedure generarLista(var pri:lista);
var
  num:integer;
  nuevo:lista;
begin
  new(nuevo);
  num:=random(200 - 101) + 100;
  nuevo^.dato:=num;
  nuevo^.sig:=nil;
  if(num <> 100) then begin
    agregarAdelante(pri, nuevo);
    generarLista(pri);
  end;
end;
procedure imprimirLista(pri:lista);
begin
  if(pri <> nil) then begin
    writeln(pri^.dato);
    pri:=pri^.sig;
    imprimirLista(pri);
  end;
end;
procedure imprimirAlreves(pri:lista);
begin

end;
var
  pri:lista;
begin
  randomize;
  pri:=nil;
  generarLista(pri);
  imprimirLista(pri);
end.
