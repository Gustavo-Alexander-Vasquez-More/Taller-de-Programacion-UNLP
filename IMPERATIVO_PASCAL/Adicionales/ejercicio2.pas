{2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2015..2024), marca,
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de
datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar juntas las patentes y colores de los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
color del auto con dicha patente.}
program ejercicio2;
type
  rangoFabricacion=2015..2024;
  auto=record
    patente:string;
    año:rangoFabricacion;
    marca:string;
    color:string;
    modelo:string;
  end;
  infoAuto=record
    marca:string;
    color:string;
  end;
  regDatosArbol=record
    marca:string
    autos:listaAutos;
  end;
  listaAutos=^nodoAutos;
  nodoAutos=record
    dato:infoAuto;
    sig:listaAutos;
  end;
  arbolPatente=^nodoArbolPatente;
  nodoArbolPatente=record
    dato:auto;
    HI:arbol;
    HD:arbol;
  end;
  arbolMarca=^nodoArbolMarca;
  nodoArbolMarca=record
    dato:regDatosArbol;
    HI:arbolMarca;
    HD:arbolMarca;
  end;
  
procedure leerAuto(var reg:auto);
var
  patente:string
  
begin
  
end;
  
procedure insertarDato_patente(var aPatente:arbol; reg:auto);
var
 nuevo:a;
begin
  if(aPatente = nil) then begin
    new(nuevo); nuevo^.dato:=reg; nuevo^.HI:=nil; nuevo^.HD:=nil; aPatente:=nuevo;
  end
  else begin
    if(reg.patente <= aPatente^.dato.patente)then
      insertarDato_patente(aPatente^.HI, reg)
    else
      insertarDato_patente(aPatente^.HD, reg);
  end;
end;

//VARIABLES DEL PROGRAMA
var
  aPatente:arbolPatente;
  aMarca:arbolMarca;
begin
  aPatente:=nil;
  aMarca:=nil;
end.
