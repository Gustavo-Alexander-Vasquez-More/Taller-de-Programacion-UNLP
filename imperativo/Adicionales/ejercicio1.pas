{1. El administrador de un edificio de oficinas tiene la información del pago de las expensas 
de dichas oficinas. Implementar un programa con: 
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que 
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del 
propietario y valor de la expensa. La lectura finaliza cuando llega el código de 
identificación 0. 
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por 
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos 
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector 
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe 
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0. 
Luego el programa debe informar el DNI del propietario o un cartel indicando que no 
se encontró la oficina. 
d) Un módulo recursivo que retorne el monto total acumulado de las expensas.}
program ejercicio1;
const dimF=300;
type
  regOficina=record
    cod:integer;
    dni:integer;
    valor:real;
  end;
  vector=array[1..dimF] of regOficina;
  
{a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que 
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del 
propietario y valor de la expensa. La lectura finaliza cuando llega el código de 
identificación 0.}

procedure leerOficina(var cod, dni:integer; var valor:real);
begin
  write('Ingrese el codigo de oficina: '); read(cod);
  if(cod <> 0)then begin
    write('Ingrese el dni: '); read(dni);
    write('Ingrese el valor de la expensa: '); read(valor);
  end;
end;
procedure cargarVector(var v:vector; var dimL:integer);
var
  cod, dni:integer;
  valor:real;
begin
  leerOficina(cod, dni, valor);
  while((dimL < dimF) AND (cod <> 0)) do begin
    dimL:=dimL + 1;
    v[dimL].cod:=cod; v[dimL].dni:=dni; v[dimL].valor:=valor;
    leerOficina(cod, dni, valor);
  end;
end;
{b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por 
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos 
vistos en la cursada.}
procedure ordenarInsercion(var v:vector; dimL:integer);
var
  i, j:integer;
  actual:regOficina;
begin
  for i:=2 to dimL do begin
    actual:=v[i];
    j:=i-1;
    while((j > 0) AND (v[j].cod > actual.cod)) do begin
      v[j + 1]:=v[j];
      j:=j - 1;
    end;
    v[j + 1]:=actual;
  end;
end;
{c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector 
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe 
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0. }
function busquedaDicotomica(v:vector; dimL, dato:integer):integer;
var
  ini, fin, medio:integer;
begin
  ini:=1;
  fin:=dimL;
  medio:=(ini + fin) div 2;
  while((ini <= fin) AND (v[medio].cod <> dato)) do begin
    if(dato < v[medio].cod) then //por la izquierda
      fin:=medio -1
    else
      ini:=medio + 1;
    medio:=(ini + fin) div 2;
  end;
  if(v[medio].cod = dato) then
    busquedaDicotomica:=medio
  else
    busquedaDicotomica:=0;
end;
{d) Un módulo recursivo que retorne el monto total acumulado de las expensas.}
function totalExpensasAcumuladas(v:vector; dimL, i:integer):real;
begin
  if(i > dimL) then
    totalExpensasAcumuladas:=0
  else
    totalExpensasAcumuladas:=v[i].valor + totalExpensasAcumuladas(v, dimL, i + 1);
end;
var
  v:vector;
  dimL, dato, pos, i:integer;
begin
  dimL:=0;
  cargarVector(v, dimL);
  ordenarInsercion(v, dimL);
  writeln('Ingrese un dato para la búsqueda dicotómica'); readln(dato);
  pos:=busquedaDicotomica(v, dimL, dato);
  if(pos > 0) then
    writeln('El dni del propietario de la oficina es: ', v[pos].dni)
  else
    writeln('No se encontró la oficina');
  i:=1;
  writeln('El monto total de las expensas acumuladas es: ', totalExpensasAcumuladas(v, dimL, i));
end.
