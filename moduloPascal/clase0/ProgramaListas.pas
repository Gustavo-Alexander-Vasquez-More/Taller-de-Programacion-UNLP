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
function BuscarElemento(pri:lista; x:integer):boolean;
begin
  while((pri <> nil) AND (pri^.dato <> x)) do
    pri:=pri^.sig;
  BuscarElemento:=(pri <> nil); //Retorna true si lo encontŕo y retorna false si nunca lo encontró
end;
var
  pri:lista;
  x:integer;
begin
  randomize;
  pri:=nil; //Inicializamos la lista en nil para indicar que está vacia la lista
  CargarLista(pri);
  ImprimirLista(pri);
  writeln('Escribir un numero cualquiera'); readln(x);
  writeln(BuscarElemento(pri, x));
end.
