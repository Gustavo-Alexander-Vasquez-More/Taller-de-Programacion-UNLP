program ejercicio2;
const dimF=300;
type
  rango=1..dimF;
  oficina=record
    cod:integer;
    dni:integer;
    expensa:real;
  end;
  vector=array[rango] of oficina;
{a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.}
procedure leerOficina(var cod, dni:integer; var expensa:real);
begin
  writeln('Ingrese el código de identificación'); readln(cod);
  writeln('Ingrese el DNI del propiertario'); readln(dni);
  writeln('Ingrese el valor de la expensa'); readln(expensa);
end;
procedure GenerarVector(var v:vector; var dimL:integer);
var
  cod, dni:integer;
  expensa:real;
begin
  leerOficina(cod, dni, expensa);
  while((dimL < dimF) AND (cod <> -1)) do begin
    dimL:=dimL + 1;
    v[dimL].cod:=cod; v[dimL].dni:=dni; v[dimL].expensa:=expensa;
    leerOficina(cod, dni, expensa);
  end;
end;
{b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina}
procedure ordenarInsercion(var v:vector; dimL:integer); //Metodo de ordenamiento por inserción
var
  i, j:integer;
  actual:oficina;
begin
  for i:=2 to dimL do begin
    actual:=v[i];
    j:=i - 1;
    while((j > 0) AND (v[j].cod > actual.cod)) do begin
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=actual;
  end;
end;
{c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}
procedure ordenarSeleccion(var v:vector; dimL:integer); //Metodo de ordenamiento por selección
var
  i, j, pos:integer;
  item:oficina;
begin
  for i:=1 to dimL-1 do begin
    pos:=i;
    for j:=i+1 to dimL do begin
      if(v[j].cod < v[pos].cod)then
        pos:=j;
    end;
    item:=v[pos];
    v[pos]:=v[i];
    v[i]:=item;
  end;
end;
var
  v:vector;
  dimL:integer;
begin
  dimL:=0;
  GenerarVector(v, dimL);
  OrdenarInsercion(v, dimL);
  OrdenarSeleccion(v, dimL);
end.
