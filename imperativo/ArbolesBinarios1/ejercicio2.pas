program ejercicio2;
//TIPOS DE DATOS DEFINIDOS POR EL USUARIO
type
  //REGISTROS
  venta=record
    codigo:integer;
    fecha:integer;
    cant:integer; //cantidad de unidades vendidas
  end;
  //LISTAS
  lista=^nodoLista;
  nodoLista=record
    dato:venta;
    sig:lista;
  end;
  productoVendido=record
    codigo:integer;
    cant:integer; //cantidad total de unidades vendidas
  end;
  productoVendido2=record
    codigo:integer;
    ventas:lista;
  end;
  //ARBOLES
  arbol1=^nodo1;
  nodo1=record
    dato:venta;
    HI:arbol1;
    HD:arbol1;
  end;
  arbol2=^nodo2;
  nodo2=record
    dato:productoVendido;
    HI:arbol2;
    HD:arbol2;
  end;
  arbol3=^nodo3;
  nodo3=record
    dato:productoVendido2;
    HI:arbol3;
    HD:arbol3;
  end;
//PROCESOS Y FUNCIONES
procedure cargarArbol1(var a:arbol1; v:venta);
var
  nuevo:arbol1;
begin
  if(a = nil)then begin
    new(nuevo); nuevo^.dato:=v; nuevo^.HI:=nil; nuevo^.HD:=nil; a:=nuevo;
  end
  else begin
    if(v.codigo >= a^.dato.codigo) then //si el codigo es mayor o igual va a la derecha
      cargarArbol1(a^.HD, v)
    else
      cargarArbol1(a^.HI, v); //sino vamos a la izquierda
  end;
end;
procedure generarArbol1(var a:arbol1);
var
  v:venta;
begin
  randomize;
  v.codigo:=random(21);
  if(v.codigo <> 0) then begin
    v.fecha:=random(21); v.cant:=random(21);
    cargarArbol1(a, v);
    generarArbol1(a);
  end;
end;
{arbol 2}
procedure cargarArbol2(var a:arbol2; codigo, cantidad:integer);
var nuevo:arbol2;
begin
  if(a = nil)then begin
    new(nuevo); nuevo^.dato.codigo:=codigo; nuevo^.dato.cant:=cantidad; nuevo^.HI:=nil; nuevo^.HD:=nil; a:=nuevo;
  end
  else if(codigo = a^.dato.codigo) then
    a^.dato.cant:=a^.dato.cant + cantidad
  else begin
    if(codigo >= a^.dato.codigo) then //si el codigo es mayor o igual va a la derecha
      cargarArbol2(a^.HD, codigo, cantidad)
    else
      cargarArbol2(a^.HI, codigo, cantidad); //sino vamos a la izquierda
  end;
end;
procedure generarArbol2(a1:Arbol1; var a2:arbol2);
begin
  //vamos a recorrer e ir agregando los nodos en el arbol2
  if(a1 <> nil) then begin
    cargarArbol2(a2, a1^.dato.codigo, a1^.dato.cant);
    generarArbol2(a1^.HI, a2);
    generarArbol2(a1^.HD, a2);
  end;
end;
{arbol 3}
procedure agregarVentaALaLista(var l: lista; v: venta);
var
  nuevo: lista;
begin
  new(nuevo);
  nuevo^.dato := v;
  nuevo^.sig := l;
  l := nuevo;
end;
procedure cargarArbol3(var a: arbol3; v: venta);
var
  nuevo: arbol3;
begin
  if (a = nil) then
  begin
    new(nuevo);
    nuevo^.dato.codigo := v.codigo;
    nuevo^.dato.ventas := nil;
    agregarVentaALaLista(nuevo^.dato.ventas, v);
    nuevo^.HI := nil;
    nuevo^.HD := nil;
    a := nuevo;
  end
  else if (v.codigo = a^.dato.codigo) then
    agregarVentaALaLista(a^.dato.ventas, v)
  else if (v.codigo < a^.dato.codigo) then
    cargarArbol3(a^.HI, v)
  else
    cargarArbol3(a^.HD, v);
end;
procedure generarArbol3(a1: arbol1; var a3: arbol3);
begin
  if (a1 <> nil) then
  begin
    cargarArbol3(a3, a1^.dato);
    generarArbol3(a1^.HI, a3);
    generarArbol3(a1^.HD, a3);
  end;
end;
//VARIABLES LOCALES DEL PROGRAMA
var
  a1:arbol1;
  a2:arbol2;
  a3:arbol3;
begin
  randomize;
  a1:=nil;
  a2:=nil;
  a3:=nil;
  generarArbol1(a1);
  generarArbol2(a1, a2);
  generarArbol3(a1, a3);
end.
