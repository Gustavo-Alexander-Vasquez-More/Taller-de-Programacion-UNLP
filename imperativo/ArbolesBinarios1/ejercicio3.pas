{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).}

program ejercicio3;
type
  rangoNota=0..10;
  rangoDia=1..31;
  rangoMes=1..12;
  rangoAnio=1995..2025;

  calendario=record
    dia:rangoDia;
    mes:rangoMes;
    anio:rangoAnio;
  end;

  regFinal=record
    legajo:integer;
    codMateria:integer;
    fecha:calendario;
    nota:rangoNota;
  end;

  listaFinales=^nodoFinales;
  nodoFinales=record
    dato:regFinal;
    sig:listaFinales;
  end;

  // Lista de finales de un alumno
  regFinalesAlumno=record
    codMateria:integer;
    fecha:calendario;
    nota:rangoNota;
  end;

  listaAlumnoFinales=^nodoAlumnoFinales;
  nodoAlumnoFinales=record
    dato:regFinalesAlumno;
    sig:listaAlumnoFinales;
  end;

  // Nodo alumno
  regAlumno=record
    legajo:integer;
    finales:listaAlumnoFinales;
  end;

  listaAlumnos=^nodoAlumno;
  nodoAlumno=record
    dato:regAlumno;
    sig:listaAlumnos;
  end;

  // Árbol ABB
  arbol=^nodoArbol;
  nodoArbol=record
    dato:regAlumno;
    HI:arbol;
    HD:arbol;
  end;

// ======================================
// PASO 1: Leer finales
procedure leerFinal(var r:regFinal; var sigue:boolean);
begin
  writeln('Ingrese legajo (0 para terminar):'); readln(r.legajo);
  if r.legajo <> 0 then
  begin
    writeln('Ingrese codigo de materia:'); readln(r.codMateria);
    writeln('Ingrese dia, mes y año del examen:');
    readln(r.fecha.dia, r.fecha.mes, r.fecha.anio);
    writeln('Ingrese nota:'); readln(r.nota);
    sigue := true;
  end
  else
    sigue := false;
end;

procedure agregarAdelante(var L:listaFinales; r:regFinal);
var
  nuevo:listaFinales;
begin
  new(nuevo);
  nuevo^.dato := r;
  nuevo^.sig := L;
  L := nuevo;
end;

procedure cargarListaFinales(var L:listaFinales);
var
  r:regFinal;
  sigue:boolean;
begin
  repeat
    leerFinal(r, sigue);
    if sigue then
      agregarAdelante(L, r);
  until not sigue;
end;

// ======================================
// PASO 2: Buscar alumno y devolverlo vía var
procedure buscarAlumno(L: listaAlumnos; legajo: integer; var encontrado: listaAlumnos);
begin
  encontrado := L;
  while (encontrado <> nil) and (encontrado^.dato.legajo <> legajo) do
    encontrado := encontrado^.sig;
end;

procedure agregarFinalAlumno(var L:listaAlumnoFinales; f:regFinalesAlumno);
var
  nuevo:listaAlumnoFinales;
begin
  new(nuevo);
  nuevo^.dato := f;
  nuevo^.sig := L;
  L := nuevo;
end;

procedure procesarListaAlumnos(pri: listaFinales; var pri2: listaAlumnos);
var
  aux: listaAlumnos;
  f: regFinalesAlumno;
begin
  while pri <> nil do
  begin
    // Copiar datos del final a regFinalesAlumno
    f.codMateria := pri^.dato.codMateria;
    f.fecha := pri^.dato.fecha;
    f.nota := pri^.dato.nota;

    // Buscar si el alumno ya existe
    buscarAlumno(pri2, pri^.dato.legajo, aux);
    if aux = nil then
    begin
      // Crear nuevo nodo alumno
      new(aux);
      aux^.dato.legajo := pri^.dato.legajo;
      aux^.dato.finales := nil;
      aux^.sig := pri2;
      pri2 := aux;
    end;

    // Agregar final a la lista del alumno
    agregarFinalAlumno(aux^.dato.finales, f);

    pri := pri^.sig;
  end;
end;

// ======================================
// PASO 3: Insertar alumnos en ABB

procedure cargarArbol(var a:arbol; r:regAlumno);
var
 nuevo:arbol;
begin
  
  if(a = nil)then begin
    new(nuevo); nuevo^.dato:=r; nuevo^.HI:=nil; nuevo^.HD:=nil; a:=nuevo;
  end
  else if(r.legajo < a^.dato.legajo)then
      cargarArbol(a^.HI, r)
  else
      cargarArbol(a^.HD, r);
end;

procedure generarArbol(var a:arbol; pri2:listaALumnos);
begin
  if(pri2 <> nil)then begin
    cargarArbol(a, pri2^.dato);
    generarArbol(a, pri2^.sig);
  end;
end;
// ======================================

procedure preOrden(a:arbol; var cantImpares:integer);
begin
  if(a <> nil)then begin
    if(a^.dato.legajo MOD 2 <> 0)then
      cantImpares:=cantImpares + 1;
    preOrden(a^.HI, cantImpares);
    preOrden(a^.HD, cantImpares);
  end;
end;

// ======================================

procedure recorrerLista(l:listaAlumnoFinales; var finalesAprobados:integer);
begin
  if(l <> nil) then begin
    if(l^.dato.nota >= 4)then
      finalesAprobados:=finalesAprobados + 1;
    recorrerLista(l^.sig, finalesAprobados);
  end;
end;

procedure preOrden2(a:arbol);
var
  finalesAprobados:integer;
begin
  finalesAprobados:=0;
  if(a <> nil)then begin
    recorrerLista(a^.dato.finales, finalesAprobados);
    writeln('Alumno: ', a^.dato.legajo); writeln('Cantidad de finales aprobados: ', finalesAprobados);
    preOrden2(a^.HI);
    preOrden2(a^.HD);
  end;
end;

// ======================================
// PROGRAMA PRINCIPAL
var
  pri: listaFinales;
  pri2: listaAlumnos;
  a: arbol;
  cantImpares:integer;
begin
  pri := nil; pri2 := nil; a := nil;
  cargarListaFinales(pri);
  procesarListaAlumnos(pri, pri2);
  generarArbol(a, pri2);
  cantImpares:=0;
  preOrden(a, cantImpares);
  writeln('La cantidad de alumnos con legajo impar es: ', cantImpares);
  preOrden2(a);
end.

