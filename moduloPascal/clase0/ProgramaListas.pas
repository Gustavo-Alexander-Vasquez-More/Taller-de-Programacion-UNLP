program ProgramaListas;
type
  lista=^nodo;
  nodo=record
    dato:integer;
    sig:lista;
  end;
procedure CargarLista(var pri:lista);
var
  num:integer;
  nuevo:lista;
begin
  num:=random(150 - 100 + 1) + 100;
  while(num <> 120) do begin
    new(nuevo);
    if(pri = nil) then begin
      nuevo^.dato:=num;
      nuevo^.sig:=nil;
      pri:=nuevo;
    end
    else begin
      nuevo^.dato:=num;
      nuevo^.sig:=pri;
      pri:=nuevo;
    end;
    num:=random(150 - 100 + 1) + 100;
  end;
end;
procedure ImprimirLista(pri:lista);
begin
  while(pri <> nil) do begin
    writeln(pri^.dato);
    pri:=pri^.sig;
  end;
end;
var
  pri:lista;
begin
  randomize;
  pri:=nil; //Inicializamos la lista en nil para indicar que está vacia la lista
  CargarLista(pri);
  ImprimirLista(pri);
end.
