program ejercicio2;
type
  rango=100..200;
  lista=^nodo;
  nodo=record
    dato:rango;
    sig:lista;
  end;
{a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100 (el cual no debe procesarse).}
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
  num:=random(200 - 100 + 1) + 100; //cada vez que llame recursivamente se generará uno nuevo;
  if(num <> 100) then begin //cuando debo parar? cual es el caso base?
    cargarLista(pri, num);
    generarLista(pri);
  end;
end;
{b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.}
procedure imprimirLista(pri:lista);
begin
  //cuando debo parar?
  if(pri <> nil) then begin
    writeln(pri^.dato);
    imprimirLista(pri^.sig);
  end;
end;
{c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.}
procedure imprimirAlreves(pri:lista);
begin
  //cuando debo parar?
  if(pri <> nil) then begin
    imprimirAlreves(pri^.sig);
    writeln(pri^.dato); //imprime desapilando (el ultimo que entro es el que se va y se imprime primero)
  end;
end;
{d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.}
function devolverMinimo(pri:lista):integer;
var
  min:integer;
begin
  //cuando debo parar?
  if(pri^.sig = nil)then
    devolverMinimo:=pri^.dato //devuelve el resultado del minimo
  else begin
    min:=devolverMinimo(pri^.sig); //apila todos los datos y al final retorna el valor del ultimo nodo(que no se apila solo retorna)
    if(pri^.dato < min)then //toma el valor del ultimo dato apilado y lo compara con el dato que retornó al final
      devolverMinimo:=pri^.dato
    else
      devolverMinimo:=min;
  end;
end;
{e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}
function encontrar(pri:lista; x:integer):boolean;
begin
  //cuando debo parar?
  if(pri = nil) then
    encontrar:=false
  else begin 
    if(pri^.dato = x) then
     encontrar:=true
    else
      encontrar:=encontrar(pri^.sig, x);   
  end;
end;
var
  pri:lista;
  x:integer;
begin
  randomize;
  generarLista(pri);
  writeln('Lista en orden');
  imprimirLista(pri);
  writeln('Lista alrevés');
  imprimirAlreves(pri);
  writeln('El minimo es ', devolverMinimo(pri));
  writeln('Ingrese un numero'); readln(x);
  writeln(encontrar(pri, x));
end.
