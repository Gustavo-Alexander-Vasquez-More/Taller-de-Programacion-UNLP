program ejercicio2;
type
  rango=100..200;
  lista=^nodo;
  nodo=record
    dato:rango;
    sig:lista;
  end;
{a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.}
procedure cargarLista(var pri:lista; num:rango);
var
  nuevo:lista;
begin
    new(nuevo); nuevo^.dato:=num; nuevo^.sig:=nil;
    if(pri = nil) then
      pri:=nuevo
    else begin
      nuevo^.sig:=pri;
      pri:=nuevo;
    end;
end;
procedure generarLista(var pri:lista);
var
  num:rango;
begin
  num:=random(101) + 100;
  if(num <> 100) then begin
	cargarLista(pri, num);
    generarLista(pri);
  end;
end;
{b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados}
procedure imprimirLista(pri:lista);
begin
  if(pri <> nil) then begin
    writeln(pri^.dato);
    imprimirLista(pri^.sig);
  end;
end;
{c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.}
procedure imprimirAlreves(pri:lista);
begin
  if(pri <> nil)then begin
    imprimirAlreves(pri^.sig);
    writeln(pri^.dato); //Imprime desapilando
  end;
end;
{d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.}
function DevolverMinimo(pri:lista):integer;
begin
  if(pri = nil) then
    DevolverMinimo:=201 //Caso base, al final devuelve 201 y lo guarda en la pila, esto nos servira como base para hacer la primera comparación.
  else begin
    DevolverMinimo:=DevolverMinimo(pri^.sig);
    if(pri^.dato < DevolverMinimo) then
      DevolverMinimo:=pri^.dato;
  end;
end;
{e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}
function Encontrar(pri: lista; x: integer): boolean;
begin
  if pri = nil then
    Encontrar := false
  else if pri^.dato = x then
    Encontrar := true
  else
    Encontrar := Encontrar(pri^.sig, x);
end;
var
  pri:lista;
  x:integer;
begin
  randomize;
  pri:=nil;
  generarLista(pri);
  writeln('Datos en orden conforme fueron creados');
  imprimirLista(pri);
  writeln('Datos en orden inverso');
  imprimirAlreves(pri);
  writeln('El valor minimo es: ', DevolverMinimo(pri));
  writeln('Ingrese un numero'); readln(x);
  writeln(Encontrar(pri, x));
end.
