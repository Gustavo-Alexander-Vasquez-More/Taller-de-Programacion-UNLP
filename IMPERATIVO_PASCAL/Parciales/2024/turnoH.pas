program turnoH;
type
  rango_sucursal=1..10;
  venta=record
    codCli:integer;
    codSuc:rango_sucursal;
    numFactura:integer;
    monto:real;
  end;
  regCompras=record
    numFactura:integer;
    monto:real;
  end;
  listaCompras=^nodoLista;
  nodoLista=record
    dato:regCompras;
    sig:listaCompras;
  end;
  regDatoArbol=record
    codCli:integer;
    compras:listaCompras;
  end;
  arbol=^nodo;
  nodo=record
    dato:regDatoArbol;
    HI:arbol;
    HD:arbol;
  end;
  vectorSucursal=array[rango_sucursal] of integer;
  
//INCISO A
//una estructura para almacenar la cantidad de ventas que tuvo una sucursal
//inicalizo el vector de sucursales

procedure inicializarVector(var vec:vectorSucursal);
var i:integer;
begin
  for i:=1 to 10 do begin
    vec[i]:=0;
  end;
end;

procedure agregarAlvector(var vec:vectorSucursal; v:venta);
begin
 vec[v.codSuc]:=vec[v.codSuc] + 1;
end;

//cargar datos para el arbol: tengo que cargar un regArbol y que este ordenado por codCli

procedure leerVentas(var v:venta; var vec:vectorSucursal);
begin
  v.codCli:=random(501);
  if(v.codCli <> 0)then begin
    v.codSuc:=random(10) + 1; v.numFactura:=random(10000) + 1; v.monto:=random(2000)/(random(10) + 1);
    agregarAlvector(vec, v);
  end;
end;

procedure agregarAdelante(var l:listaCompras; v:venta);
var
  nuevo:listaCompras;
begin
  new(nuevo); nuevo^.dato.numFactura:=v.numFactura; nuevo^.dato.monto:=v.monto; nuevo^.sig:=nil;
  if(l = nil)then
    l:=nuevo
  else begin
    nuevo^.sig:=l;
    l:=nuevo;
  end;
end;

procedure cargarDatoArbol(var a:arbol; v:venta);
var
  nuevo:arbol;
begin
  if(a = nil) then begin
   new(nuevo);
   nuevo^.dato.codCli:=v.codCli;
   nuevo^.dato.compras:=nil; //por cada nodo nuevo del arbol inicializamos su lista en nil
   agregarAdelante(nuevo^.dato.compras, v); //al arbol que recibe le agrega los datos a su lista agregando adelante
   nuevo^.HI:=nil;
   nuevo^.HD:=nil;
   a:=nuevo;
  end
  else if(a^.dato.codCli = v.codCli) then
    agregarAdelante(a^.dato.compras, v)
  else begin
    if(v.codCli < a^.dato.codCli) then
      cargarDatoArbol(a^.HI, v)
    else
      cargarDatoArbol(a^.HD, v);
  end;
end;

procedure generarArbol(var a:arbol; var vec:vectorSucursal);
var
  v:venta;
begin
  leerVentas(v, vec);
  while(v.codCli <> 0) do begin
    cargarDatoArbol(a, v);
    leerVentas(v, vec);
  end;
end;

//INCISO B

function recorrer_y_contar(l:listaCompras; monto:real):integer;
var
  cantidad:integer;
begin
  cantidad:=0;
  while(l <> nil) do begin
    if(l^.dato.monto > monto)then
      cantidad:=cantidad + 1;
    l:=l^.sig;
  end;
  recorrer_y_contar:=cantidad;
end;

function buscar(a:arbol; monto:real; codCli:integer):integer; //retornara la cantidad de facturas cuyo monto es superior al ingresado
begin
  if(a = nil) then
    buscar:=0
  else if(codCli = a^.dato.codCli) then begin
    buscar:=recorrer_y_contar(a^.dato.compras, monto);
  end
  else begin
    if(codCli < a^.dato.codCli) then
      buscar:=buscar(a^.HI, monto, codCli)
    else
      buscar:=buscar(a^.HD, monto, codCli);
  end;
end;
//INCISO C realizar un modulo recursivo que reciba el vector de sucursales y retorne la sucursal con mas ventas

function sucursalMasVentas(vec:vectorSucursal; i:integer):integer;
var
  maxIndice:integer;
begin
  if(i = 10) then
    sucursalMasVentas:=10
  else begin
    maxIndice:=sucursalMasVentas(vec, i + 1);
    if(vec[i] >= vec[maxIndice]) then
      sucursalMasVentas:=i
    else
      sucursalMasVentas:=maxIndice;
  end;
end;
//Variables locales del programa
var
  a:arbol;
  vec:vectorSucursal;
  monto:real;
  codCli:integer;
  cant:integer;
begin
  randomize;
  a:=nil;
  inicializarVector(vec);
  generarArbol(a, vec);
  writeln('--------------------------');
  writeln('Buscador de facturas que exceden a un monto determinado');
  writeln('Ingrese un monto: '); read(monto);
  writeln('Ingrese un codigo de cliente'); read(codCli);
  cant:=buscar(a, monto, codCli);
  if(cant <> 0)then
    writeln('La cantidad de facturas mayores al monto ingresado son: ', cant)
  else
    writeln('No se han encontrado facturas con monto mayor o el cliente no existe');
  writeln('La sucursal con mas ventas es: ', sucursalMasVentas(vec, 1));
end.
