program turnoO;
type
  rango_dias=1..30;
  rango_meses=1..12;
  compra=record
    cod_producto:integer;
    cod_cliente:integer;
    dia:rango_dias;
    mes:rango_meses;
  end;
  arbolCompras=^nodo;
  nodo=record
    dato:compra;
    HI:arbolCompras;
    HD:arbolCompras;
  end;
  vectorArboles=array[rango_meses] of arbolCompras;
//INICIALIZAMOS EL VECTOR DE ARBOLES
procedure inicializarVectorArboles(var v:vectorArboles);
var i:integer;
begin
  for i:=1 to 12 do
    v[i]:=nil;
end;
//INCISO A
procedure leerCompra(var c:compra);
begin
  c.cod_cliente:=random(200);
  if(c.cod_cliente <> 0) then begin
    c.dia:=random(30) + 1;
    c.mes:=random(12) + 1;
    c.cod_producto:=random(100) + 100;
  end;
end;

procedure insertarDatoArbol(var a:arbolCompras; dato:compra);
var
  nuevo:arbolCompras;
begin
  if(a = nil) then begin
    new(nuevo);
    nuevo^.dato:=dato;
    nuevo^.HI:=nil;
    nuevo^.HD:=nil;
    a:=nuevo;
  end
  else begin
    if(dato.cod_producto <= a^.dato.cod_producto) then
      insertarDatoArbol(a^.HI, dato)
    else
      insertarDatoArbol(a^.HD, dato);
  end;
end;

procedure generarVector(var v:vectorArboles);
var
  c:compra;
begin
  leerCompra(c);
  while(c.cod_cliente <> 0) do begin
    insertarDatoArbol(v[c.mes], c);
    leerCompra(c);
  end;
end;

//INCISO B

function contarComprasMes(a:arbolCompras):integer;
begin
  if(a = nil)then
    contarComprasMes:=0
  else
    contarComprasMes:=1 + contarComprasMes(a^.HI) + contarComprasMes(a^.HD);
end;

procedure calcularMesMaxCompras(v:vectorArboles; var maxCompra, maxMes:integer; i:integer);
var
  cantidad:integer;
begin
  if(i > 12) then
    cantidad:=0
  else begin
    cantidad:=contarComprasMes(v[i]);
    if(cantidad > maxCompra) then begin
      maxCompra:=cantidad;
      maxMes:=i;
    end;
    calcularMesMaxCompras(v, maxCompra, maxMes, i + 1);
  end;
end;

//INCISO C

function consultarCompraArbol(a:arbolCompras; cod:integer):boolean;
begin
  if(a = nil) then
    consultarCompraArbol:=false
  else if(a^.dato.cod_producto = cod) then
    consultarCompraArbol:=true
  else begin
    if(cod > a^.dato.cod_producto) then
      consultarCompraArbol:=consultarCompraArbol(a^.HD, cod)
    else
      consultarCompraArbol:=consultarCompraArbol(a^.HI, cod); 
  end;
end;

function consultar(v:vectorArboles; mes:rango_meses; cod:integer):boolean;
begin
  consultar:=consultarCompraArbol(v[mes], cod);
end;

//VARIABLES LOCALES DEL PROGRAMA
var
  v:vectorArboles;
  maxCompra, maxMes, cod:integer;
  mes:rango_meses;
  verification:boolean;
begin
  inicializarVectorArboles(v);
  generarVector(v);
  maxCompra:=-1;
  maxMes:=0;
  calcularMesMaxCompras(v, maxCompra, maxMes, 1);
  read(mes); read(cod);
  verification:=consultar(v, mes, cod);
  if(verification)then
    writeln('Si se encontró la compra buscada')
  else
    writeln('La compra que intentas buscar no existe');
end.
