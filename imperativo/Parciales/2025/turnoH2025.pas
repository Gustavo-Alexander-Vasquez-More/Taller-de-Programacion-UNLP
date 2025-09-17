program turnoH2025;
type
  rango_dias=1..31;
  rango_meses=1..12;
  compra=record
    cod_cliente:integer;
    dia:rango_dias;
    mes:rango_meses;
    monto:real;
  end;
  vector=array[rango_meses] of real;
  reg_dato_arbol=record
    cod_cliente:integer;
    monto_x_mes:vector;
  end;
  arbol=^nodo;
  nodo=record
    dato:reg_dato_arbol;
    HI:arbol;
    HD:arbol;
  end;
  
//MODULOS

procedure leerCompra(var c:compra);
begin
  c.cod_cliente:=random(1000);
  if(c.cod_cliente <> 0) then begin
    c.dia:=random(30) + 1;
    c.mes:=random(12) + 1;
    c.monto:=random(20000)/(random(10) + 1);
  end;
end;

procedure inicializarVector(var v:vector);
var i:integer;
begin
  for i:=1 to 12 do
    v[i]:=0;
end;

//INCISO A

//necesitamos un arbol con un registro que contenga cod_cliente y un vector de meses y en cada mes el monto total;

procedure agregarAlvector(var v:vector; monto:real; i:integer); //recibe el vector, monto y el indice(el mes)
begin
  v[i]:=v[i] + monto;
end;

procedure cargarDatoArbol(var a:arbol; c:compra);
var nuevo:arbol;
begin
  if(a = nil)then begin
    new(nuevo);
    inicializarVector(nuevo^.dato.monto_x_mes); // inicializa el vector en 0
    nuevo^.dato.cod_cliente:=c.cod_cliente;
    nuevo^.dato.monto_x_mes[c.mes]:=c.monto;
    nuevo^.HI:=nil;
    nuevo^.HD:=nil;
    a:=nuevo;
  end
  else if (c.cod_cliente = a^.dato.cod_cliente) then
    //logica para insertar el monto en el vector
    agregarAlvector(a^.dato.monto_x_mes, c.monto, c.mes)
  else begin
    if(c.cod_cliente < a^.dato.cod_cliente)then
      cargarDatoArbol(a^.HI, c)
    else
      cargarDatoArbol(a^.HD, c);
  end;
end;

procedure generarArbol(var a:arbol);
var
  c:compra;
begin
  leerCompra(c);
  while (c.cod_cliente <> 0) do begin
    cargarDatoArbol(a, c);
    leerCompra(c);
  end;
end;

//INCISO B

function recorrer_y_calcular(v:vector; i:integer):integer;
var
  maximo:integer;
begin
  if(i = 12)then
    recorrer_y_calcular:=12
  else begin
    maximo:=recorrer_y_calcular(v, i + 1);
    if(v[i] > v[maximo]) then
      recorrer_y_calcular:=i
    else
      recorrer_y_calcular:=maximo;
  end;
end;
function buscar(a:arbol; cod:integer):integer;
begin
  if(a = nil)then
    buscar:=0
  else if(cod = a^.dato.cod_cliente) then
    buscar:=recorrer_y_calcular(a^.dato.monto_x_mes, 1)
  else begin
    if(cod <= a^.dato.cod_cliente) then
      buscar(a^.HI, cod)
    else
      buscar(a^.HD, cod);
  end;
end;

//variables locales del programa
var
  a:arbol;
  cod:integer;
begin
  randomize;
  a:=nil;
  generarArbol(a);
  Writeln('Ingrese un codigo de cliente'); readln(cod);
  writeln('El mes con mas gasto fue el: ', buscar(a, cod));
end.
