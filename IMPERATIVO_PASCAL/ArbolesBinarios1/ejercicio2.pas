program ejercicio2;
type
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

var
  a:arbol;
begin
  randomize;
  a:=nil;
  generarArbol(a);
end.
