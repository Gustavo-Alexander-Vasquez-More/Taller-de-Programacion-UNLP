{3. Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.}

program ejercicio3;
type
  //Estructura de producto vendido(lo que se tiene que almacenar)
  regProducto=record
    cod:integer;
    cantVendidos:integer;
    total:real;
  end;
  //Estructura de una venta (Lo que se tiene que leer)
  regVenta=record
    codVenta:integer;
    codProducto:integer;
    cantVendidos:integer;
    precioUnit:real;
  end;
  //arbol
  arbol=^nodo;
  nodo=record
    dato:regProducto;
    HI:arbol;
    HD:arbol;
  end;
  
{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.}

procedure leerVenta(var codVenta, codProducto, cantVendidos:integer; var precioUnit:real); //cada venta correcta que lee crea un registro de la venta
begin
    write('Ingresa el codigo de la venta:'); read(codVenta);
    write('Ingresa el codigo del producto:'); read(codProducto); 
    write('Ingresa la cantidad de unidades vendidas:'); read(cantVendidos); 
    write('Ingresa el precio unitario del producto:'); read(precioUnit); 
end;

procedure insertarDato(var a:arbol; v:regVenta);
var
 nuevo:arbol;
begin
  if (a = nil) then begin
    new(nuevo);
    nuevo^.dato.cod:=v.codProducto;
    nuevo^.dato.cantVendidos:=v.cantVendidos;
    nuevo^.dato.total:=v.cantVendidos * v.precioUnit;
    nuevo^.HI:=nil;
    nuevo^.HD:=nil;
    a:=nuevo;
  end
  else if(v.codProducto = a^.dato.cod) then begin
    a^.dato.cantVendidos:=a^.dato.cantVendidos + v.cantVendidos;
    a^.dato.total:=a^.dato.total + (v.cantVendidos * v.precioUnit);
  end
  else begin
    if(v.codProducto < a^.dato.cod) then
      insertarDato(a^.HI, v)
    else
      insertarDato(a^.HD, v);
  end;
end;

procedure generarArbol(var a:arbol); //sera con while
var
  codVenta, codProducto, cantVendidos:integer;
  precioUnit:real;
  v:regVenta;
begin
  leerVenta(codVenta, codProducto, cantVendidos, precioUnit);
  v.codVenta:=codVenta;
  if(v.codVenta <> -1) then begin
    v.codProducto:=codProducto; v.cantVendidos:=cantVendidos; v.precioUnit:=precioUnit;
	insertarDato(a, v);
	generarArbol(a);
  end;
end;

//b. Imprimir el contenido del árbol ordenado por código de producto.

procedure enOrden(a:arbol);
begin
  if(a <> nil)then begin
    enOrden(a^.HI);
    writeln('Codigo de producto: ', a^.dato.cod); writeln('Cantidad de unidades vendidas: ',a^.dato.cantVendidos); writeln('Total: $', a^.dato.total);
    enOrden(a^.HD);
  end;
end;

//c. Retornar el código de producto con mayor cantidad de unidades vendidas.

procedure comparar(a:arbol; var mayor, codMayor:integer);
begin
  if(a^.dato.cantVendidos > mayor) then begin
    mayor:=a^.dato.cantVendidos;
    codMayor:=a^.dato.cod;
  end;
end;

procedure enOrden2(a:arbol; var mayor, codMayor:integer);
begin
  if(a <> nil)then begin
    enOrden2(a^.HI, mayor, codMayor);
    comparar(a, mayor, codMayor);
    enOrden2(a^.HD, mayor, codMayor);
  end;
end;

{d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.}

function encontrarMenores(a:arbol; valor:integer):integer;
begin
  if(a = nil)then
    encontrarMenores:=0
  else if(a^.dato.cod < valor) then
    encontrarMenores:=1 + encontrarMenores(a^.HI, valor) + encontrarMenores(a^.HD, valor)
  else
    encontrarMenores:=encontrarMenores(a^.HI, valor);
end;

//VARIABLES LOCALES DEL PROGRAMA

var
  a:arbol;
  mayor, codMayor, valor:integer;
begin
  a:=nil; //inicializamos el arbol vacío
  generarArbol(a);
  enOrden(a);
  mayor:=0;
  codMayor:=0;
  enOrden2(a, mayor, codMayor);
  writeln('el código de producto con mayor cantidad de unidades vendidas es: ', codMayor);
  Writeln('Ingrese un valor'); readln(valor);
  writeln('la cantidad de códigos que existen en el árbol que son menores que el valor que se recibe como parámetro es: ', encontrarMenores(a, valor))
end.
