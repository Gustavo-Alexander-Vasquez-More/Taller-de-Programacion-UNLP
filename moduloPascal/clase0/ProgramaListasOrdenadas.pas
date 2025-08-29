program ProgramaListasOrdenadas;
type
  lista=^nodo;
  nodo=record
    dato:integer;
    sig:lista;
  end;

procedure CargarListaOrdenada(var pri:lista);
var
  nuevo, act, ant:lista;
  num:integer;
begin
  num:=random(150 - 100 + 1) + 100;
  while (num <> 120) do begin
    new(nuevo);
    nuevo^.dato:=num;
    nuevo^.sig:=nil;
    if((pri = nil) OR (num < pri^.dato)) then begin //Este if se encarga de poner el primero nodo si la lista esta vacia o si el num es menor al num del primer nodo
      nuevo^.sig:=pri;
      pri:=nuevo;
    end
    else begin
      ant:=pri;  //cada vez que se inserta un nuevo nodo debemos empezar desde el incio para recorrer la lista
      act:=pri^.sig;
      while((act <> nil) AND (act^.dato <= num)) do begin //Con este bucle empezaremos a recorrer la lista y determinar donde vamos a poner el nuevo nodo.
        ant := act;
        act := act^.sig;
      end;
      nuevo^.sig := act;
      ant^.sig := nuevo;
    end;
    num := random(150 - 100 + 1) + 100; //vuelve a generar los numeros aleatorios
  end;
end;
procedure ImprimirLista(pri:lista);
begin
  while(pri <> nil) do begin
    writeln(pri^.dato);
    pri:=pri^.sig;
  end;
end;
function BuscarElementoOrdenado(pri:lista; x:integer):boolean;
begin
  while((pri <> nil) AND (pri^.dato < x)) do
    pri:=pri^.sig;
  // Si pri no es nil y el dato es igual a x, lo encontramos
  if (pri <> nil) and (pri^.dato = x) then
    BuscarElementoOrdenado := true
  else
    BuscarElementoOrdenado := false;
end;
var
  pri:lista;
  x:integer;
begin
  randomize;
  pri:=nil;
  CargarListaOrdenada(pri);
  ImprimirLista(pri);
  writeln('Ingresa un numero'); readln(x);
  writeln(BuscarElementoOrdenado(pri, x));
end.
