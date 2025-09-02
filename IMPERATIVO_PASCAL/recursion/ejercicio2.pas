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
  if(pri <> nil) then begin
    imprimirAlreves(pri^.sig);
    writeln(pri^.dato);
  end;
end;
function valorMinimo(pri:lista): integer;
var 
  min: integer;
begin
  if pri^.sig = nil then
    valorMinimo := pri^.dato   
    // Caso base: este es el último nodo de la lista.
    // No se hace ninguna llamada recursiva desde aquí, 
    // por lo que no se apila. Marca el inicio del desapilado.
  else begin
    min := valorMinimo(pri^.sig);  
    // Llamada recursiva: apila todas las llamadas 
    // hasta llegar al nodo anterior al último.
    // Cada llamada queda pendiente de la comparación.
    
    if pri^.dato < min then
      valorMinimo:= pri^.dato  
      // Comparación durante el desapilado: 
      // el nodo actual (pri^.dato) se compara con el mínimo
      // que vino del resto de la lista. Si es menor, se actualiza.
    else
      valorMinimo := min;  
      // Si no es menor, se mantiene el mínimo recibido.
  end;
end;
{
function encontrarValor(pri:lista; x:integer):boolean;
begin
  if(pri <> nil) then begin
    encontrarValor(pri^.sig)
    if(pri^.dato <> x) then
      encontrarValor:=false
    else
      encontrarValor:=true;
  end;
end;
}
var
  pri:lista;
  x:integer;
  respuesta:boolean;
begin
  randomize;
  pri:=nil;
  generarLista(pri);
  imprimirLista(pri);
  imprimirAlreves(pri);
  writeln('este es el valor minimo: ', valorMinimo(pri));
  writeln('Ingrese el valor a buscar:'); readln(x);
  respuesta:=encontrarValor(pri, x);
  if(respuesta) then
    writeln('El valor se encontró')
  else if(NOT respuesta) then
    writeln('No se encontró el valor');
end.
