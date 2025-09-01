program gimnasio;
type
  rangeCli=1..500;
  rangeAct=1..5;
  contador=array[rangeAct] of integer;
  asistencia=record
    dia:integer;
    mes:integer;
    anio:integer;
    num_client:rangeCli;
    activity:rangeAct;
  end;
  lista=^nodo;
  nodo=record
    dato:asistencia;
    sig:lista;
  end;
procedure cargarLista(var pri:lista);
var
  nuevo, act, ant:lista;
  dia, mes, anio:integer;
  activity:rangeAct;
  num:integer;
begin
  num:=random(501);
  while(num <> 0) do begin
    new(nuevo);
    writeln('Ingrese el dia'); readln(dia); 
    writeln('ingrese el mes'); readln(mes); 
    writeln('ingrese el año'); readln(anio); 
    writeln('Ingrese el tipo de actividad'); readln(activity);
    nuevo^.dato.dia:=dia; nuevo^.dato.mes:=mes; nuevo^.dato.anio:=anio; nuevo^.dato.activity:=activity; nuevo^.dato.num_client:=num; nuevo^.sig:=nil;
    if((pri = nil) OR (pri^.dato.num_client > num)) then begin //Siempre se va a fijar en si el nuevo numero es menor al de primer nodo.
      // Si la lista está vacía (pri = nil) o el primer nodo de la lista tiene un num_client mayor que el nuevo número generado,
      // entonces el nuevo nodo debe ser el primero de la lista. Esto asegura que la lista quede ordenada de menor a mayor.
      // Ejemplo: Si el primer nodo tiene num_client = 20 y el nuevo número generado es 15, como 20 > 15, el nuevo nodo con 15 debe ir antes.
      nuevo^.sig:=pri;
      pri:=nuevo;
    end
    else begin
      ant:=pri;
      act:=ant^.sig;
      while((act <> nil) AND (act^.dato.num_client < num)) do begin
        //Me asegura que si el valor de act es menor que num sigo avanzando hasta que sea mayor.
        //ahí es donde debo insertar el nuevo nodo entre el ant y el act.
        ant:=act;
        act:=act^.sig;
      end;
      //Aqui entra la logica cuando ya num_client del actual es mayor entonces debemos insertar el neuvo nodo entre el ant y el act.
      nuevo^.sig:=act;
      ant^.sig:=nuevo;
    end;
    num:=random(501);
  end;
end;
procedure ImprimirLista(pri:lista);
begin
  while(pri <> nil) do begin
    writeln(pri^.dato.dia); writeln(pri^.dato.mes); writeln(pri^.dato.anio); writeln(pri^.dato.num_client); writeln(pri^.dato.activity);
    pri:=pri^.sig;
  end;
end;
function BuscarAsistencias(pri:lista; x:integer):integer;
var
  cant_asistencias:integer;
begin
  cant_asistencias:=0;
  while(pri <> nil) do begin
    if(pri^.dato.num_client = x) then
      cant_asistencias:=cant_asistencias + 1;
    pri:=pri^.sig;
  end;
  BuscarAsistencias:=cant_asistencias;
end;

procedure inicializarVector(var v:contador);
var
  i:integer;
begin
  for i:=1 to 5 do
    v[i]:=0;
end;
function mayorActividad(var v:contador; pri:lista):integer;
var
  max, i, actividad:integer;
begin
  max:=-1;
  actividad:=0;
  inicializarVector(v);
  while(pri <> nil) do begin
    v[pri^.dato.activity]:=v[pri^.dato.activity] + 1;
    pri:=pri^.sig;
  end;
  for i:=1 to 5 do begin
    if(v[i] > max) then begin
      max:=v[i];
      actividad:=i;
    end;
  end;
  mayorActividad:=actividad;
end;
var
  pri:lista;
  x, asistencias:integer;
  vCounter:contador;
begin
  randomize;
  pri:=nil;
  cargarLista(pri);
  ImprimirLista(pri);
  writeln('Ingrese un numero de cliente'); readln(x);
  asistencias := BuscarAsistencias(pri, x);
  if (asistencias = 0) then
    writeln('Este cliente no vino nunca o no está registrado en el sistema')
  else
    writeln('La cantidad de asistencias del cliente numero ', x, ' es de ', asistencias, ' asistencias');
  writeln('La actividad con la mayor asistencia fue la número: ', mayorActividad(vCounter, pri));
end.
