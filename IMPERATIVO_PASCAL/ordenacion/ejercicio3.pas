program ejercicio3;
const
  dimF = 8;
type
  rango = 1..dimF;
  pelicula = record
    cod: integer;
    genre: rango;
    puntaje: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: pelicula;
    sig: lista;
  end;
  vector = array[rango] of lista;
  // Vector dinámico para códigos y puntajes
  tipoMax = record
    cod: integer;
    puntaje: real;
  end;
  vectorMax = array[1..dimF] of tipoMax;

// Inicializa el vector de listas
procedure inicializarVector(var v: vector);
var i: integer;
begin
  for i := 1 to dimF do
    v[i] := nil;
end;

// Lee una película desde teclado
procedure leerPelicula(var p: pelicula);
begin
  writeln('Escriba el código de la película:');
  readln(p.cod);
  if p.cod <> -1 then begin
    writeln('Escriba el código del género (1-8):');
    readln(p.genre);
    writeln('Escriba el puntaje de la película:');
    readln(p.puntaje);
  end;
end;

// Agrega película al final de la lista
procedure agregarAlFinal(var l: lista; p: pelicula);
var
  nuevo, act: lista;
begin
  new(nuevo);
  nuevo^.dato := p;
  nuevo^.sig := nil;
  if l = nil then
    l := nuevo
  else begin
    act := l;
    while act^.sig <> nil do
      act := act^.sig;
    act^.sig := nuevo;
  end;
end;

// Carga las películas agrupadas por género
procedure cargarDatos(var v: vector);
var
  p: pelicula;
begin
  inicializarVector(v);
  leerPelicula(p);
  while p.cod <> -1 do begin
    agregarAlFinal(v[p.genre], p);
    leerPelicula(p);
  end;
end;

// Recorrer una lista y retornar código y puntaje máximo
procedure recorrerLista(l: lista; var codMax: integer; var puntMax: real);
begin
  codMax := -1;
  puntMax := -1;
  while l <> nil do begin
    if l^.dato.puntaje > puntMax then begin
      puntMax := l^.dato.puntaje;
      codMax := l^.dato.cod;
    end;
    l := l^.sig;
  end;
end;

// Genera vectorMax solo con géneros presentes y devuelve dimensión lógica
procedure mayorPuntaje(v: vector; var vMax: vectorMax; var dimL: integer);
var
  i, codMax: integer;
  puntMax: real;
begin
  dimL := 0;
  for i := 1 to dimF do begin
    recorrerLista(v[i], codMax, puntMax);
    if codMax <> -1 then begin
      dimL := dimL + 1;
      vMax[dimL].cod := codMax;
      vMax[dimL].puntaje := puntMax;
    end;
  end;
end;

// Ordena vMax por puntaje (método de inserción)
procedure ordenarInsercion(var vMax: vectorMax; dimL: integer);
var
  i, j: integer;
  actual: tipoMax;
begin
  for i := 2 to dimL do begin
    actual := vMax[i];
    j := i - 1;
    while (j > 0) and (vMax[j].puntaje > actual.puntaje) do begin
      vMax[j+1] := vMax[j];
      j := j - 1;
    end;
    vMax[j+1] := actual;
  end;
end;

// Muestra código de película con menor y mayor puntaje del vector ordenado
procedure minimo_y_maximo(vMax: vectorMax; dimL: integer);
begin
  if dimL = 0 then
    writeln('No se cargaron películas.')
  else begin
    writeln('Código de película con menor puntaje: ', vMax[1].cod, ' (Puntaje: ', vMax[1].puntaje:0:2, ')');
    writeln('Código de película con mayor puntaje: ', vMax[dimL].cod, ' (Puntaje: ', vMax[dimL].puntaje:0:2, ')');
  end;
end;

// Programa principal
var
  v: vector;
  vMax: vectorMax;
  dimL: integer;
begin
  cargarDatos(v);
  mayorPuntaje(v, vMax, dimL);
  ordenarInsercion(vMax, dimL);
  minimo_y_maximo(vMax, dimL);
end.
