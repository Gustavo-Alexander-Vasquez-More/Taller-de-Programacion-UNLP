program gimnasio;
type
  rangeCli=1..500;
  rangeAct=1..5;
  asistencia=record
    dia:integer;
    mes:integer;
    anio:integer;
    num_client:rangeCli;
    activity:rangeAct;
  end;
  lista=^nodo;
  nodo=recordar
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
    writeln('Ingrese el dia'); readln(dia); writeln('ingrese el mes'); readln(mes); writeln('ingrese el año'); readln(anio); writeln('Ingrese el tipo de actividad'); readln(activity);
    nuevo^.dato.dia:=dia; nuevo^.dato.mes:=mes; nuevo^.dato.anio:=anio; nuevo^.dato.activity:=activity;
    if() then begin
    
    end
    else begin
    
    
      while() do begin
      
      end;
    end;
    num:=random(501)
  end;
end;
var
  pri:lista;
begin
  randomize;
  pri:=nil;
end.