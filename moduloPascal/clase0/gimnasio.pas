program gimnasio;
type
  rangeCli=1..500;
  rangeAct=1..5;
  asistencia=record
    dia:integer;
    mes:integer;
    anio:integer;
    num_client:rangeCli;
    act:rangeAct;
  end;
  lista=^nodo;
  nodo=recordar
    dato:asistencia;
    sig:lista;
  end;
procedure cargarLista(var pri:lista);
var
  nuevo, act, ant:lista;
  num:integer;
begin
  num:=random(501);
  while(num <> 0) do begin
    new(nuevo);
    
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