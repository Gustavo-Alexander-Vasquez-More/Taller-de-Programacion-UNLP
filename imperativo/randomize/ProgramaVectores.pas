//Teniendo en cuenta que el minimo tiene que ser un numero negativo, segun lo que dijeron en clase.
program ProgramaVectores;
const dimF=50;
type
  rangeMin=-9999..-1;
  rangeV=1..dimF;
  vector=array[rangeV] of integer;
procedure CargarVector(var v:vector; min:rangeMin; max:integer; var dimL:integer);
var 
  num:integer;
  sigue:boolean;
begin
  sigue:=true;
  while((dimL < dimF) AND sigue) do begin //esto resuelve el caso de que si nunca sale el 0 el vector se queda en 50 y su dimension logica también.
    num:=random(max - min + 1) + min; //esto genera los numeros aleatorios dentro del rango.
    if(num <> 0) then begin
      dimL:=dimL + 1; //al principio sera 1 si esque pasa el if
      v[dimL]:=num;
    end
    else
      sigue:=false;
  end;
end;
procedure ImprimirVector(v:vector; dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do //Qué cambiaría para imprimir en orden inverso? Hacer un downto.
    writeln(v[i]);
end;
var
  v:vector;
  min:rangeMin;
  max, dimL:integer;
begin
  randomize;
  dimL:=0; //Inicializamos la dimensión logica en 0 cuando el vector esta vacio.
  writeln('Escribe el rango minimo, tiene que ser un numero negativo:'); readln(min);
  writeln('Escribe el rango maximo'); readln(max);
  CargarVector(v, min, max, dimL);
  if(dimL > 0) then begin
    writeln('La cantidad de elementos en el vector es: ', dimL);
    ImprimirVector(v, dimL);
  end
  else
    writeln('El vector quedó vacio');
end.
