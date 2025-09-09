program ejercicio2;
type
  {tipos para el primer arbol}
  venta=record
    cod:integer;
    fecha:integer;
    cant_u_vendidas:integer;
  end;
  arbol=^nodo;
  nodo=record
    dato:venta;
    HI:arbol; //hoja izquierda
    HD:arbol; //hoja derecha
  end;
  {tipos para el arbol 2}
  producto1=record
    cod:integer;
    cant_total_vendidas:integer;
  end;
  arbol2=^nodo2;
  nodo2=record
    dato:producto1;
    HI:arbol2;
    HD:arbol2;
  end;
{i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.}
procedure cargarDato(var a:arbol; v:venta);
var
  nuevo:arbol;
begin
  //necesitamos cargar el arbol con los datos
  if(a = nil) then begin
    new(nuevo); nuevo^.dato:=v; nuevo^.HI:=nil; nuevo^.HD:=nil; a := nuevo;
  end
  else begin
    if(v.cod <= a^.dato.cod) then
      cargarDato(a^.HD, v)
    else
      cargarDato(a^.HI, v);
  end;
end;
procedure generarArbol(var a:arbol);
var
  v:venta;
begin
  v.cod:=random(21);
  if(v.cod <> 0) then begin
    v.fecha:=random(100); v.cant_u_vendidas:=random(100); //generamos datos aleatorios
    cargarDato(a, v);
    generarArbol(a);
  end;
end;
{ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.}
procedure recorrer_y_sumar(a:arbol);
var 
  codProducto, contVentas:integer;
begin
  codProducto
end;
procedure cargarDatoProducto1(var a:arbol2; p:producto1);
var nuevo:arbol2;
begin
  if(a = nil)then begin
    new(nuevo); nuevo^.dato:=p; nuevo^.HI:=nil; nuevo^.HD:=nil; a:=nuevo;
  end
  else begin
    if(p.cod <=a^.dato.cod)then
      cargarDatoProducto1(a^.HD, p)
    else
      cargarDatoProducto1(a^.HI, p);
  end;
end;
procedure generarArbol2(var a:arbol2);
var
  p:producto1;
begin
  p.cod:=random(21);
  //necesitamos recorrer el primer arbol e ir acumulando sus ventas
    
    cargarDatoProducto1(a, p);
    generarArbol2(a);
  end;
end;
var
  a:arbol;
  a2:arbol2;
begin
  randomize;
  a:=nil;
  a2:=nil;
  generarArbol(a);
  generarArbol2(a2);
end.
