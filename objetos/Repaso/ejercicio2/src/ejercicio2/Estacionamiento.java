/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio2;

/**
 *
 * @author phantomroot
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int pisos;
    private int plazas;
    private Auto[][] autos;
    
    //constructores
    /* Constructor debe recibir nombre y dirección, e iniciar el estacionamiento
    con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas
    por piso. El estacionamiento inicialmente no tiene autos. */

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.pisos=5;
        this.plazas=10;
        this.autos=new Auto[getPlazas()][getPisos()]; //Java pone cada auto en nil.. [filas][columnas]=[plazas][pisos]
        for(int piso=0; piso < getPisos(); piso++){
            for(int plaza=0; plaza < getPlazas(); plaza++){
                this.autos[plaza][piso]=null;
            }
        }
        this.horaApertura="8:00";
        this.horaCierre="21:00";
    }
    /*
    constructor debe recibir nombre, dirección, hora de apertura, hora de
    cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
    estacionamiento con los datos recibidos y sin autos. 
    */

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisos=pisos;
        this.plazas=plazas;
        this.autos =new Auto[getPlazas()][getPisos()]; //Java pone cada auto en nil.. [filas][columnas]=[plazas][pisos];
        for(int piso=0; piso < getPisos(); piso++){
            for(int plaza=0; plaza < getPlazas(); plaza++){
                this.autos[plaza][piso]=null;
            }
        }
    }
    
    //getters & setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getAutos() {
        return autos;
    }

    public void setAutos(Auto[][] autos) {
        this.autos = autos;
    }

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    
    
    /*METODOS:
    Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto
    en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir,
    están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.
    */
    public void registrarAuto(int piso, int plaza, String propietario, int patente){ //se supone que lo que ingrese es valido y la posicion esta desocupada
        this.autos[plaza - 1][piso - 1]=new Auto(propietario, patente);
    }
    public String toString(){
        String cadena="";
        for(int piso=0; piso < getPisos(); piso++){
            for(int plaza=0; plaza < getPlazas(); plaza++){
                if(this.autos[plaza][piso] != null){
                    cadena+="\nPiso " + (piso + 1) + ", Plaza " + (plaza+1) + ": " +this.autos[plaza][piso].toString();
                }else{
                    cadena+="\nPiso " + (piso + 1) + ", Plaza " + (plaza+1) + ": Libre";
                }
            }
        }
        return cadena;
    }
    /*
    Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha
    plaza (teniendo en cuenta todos los pisos).
    */
    public int cantidadAutosPorPlaza(int numPlaza){ //es la plaza
        int cantAutos=0;
            for(int piso=0; piso < getPisos(); piso++){
              if(this.autos[numPlaza - 1][piso] != null){
                  cantAutos++;
              }
            }
        return cantAutos;
    }
    
    /*
    Dada una patente, obtener un String que contenga el número de piso y plaza
    donde está dicho auto en el estacionamiento. En caso de no encontrarse,
    retornar el mensaje “Auto Inexistente”.
    */
        public String encontrarAuto(int patente){
            String auto="";
            boolean encontre=false;
            int plaza=0;
            int piso;
            while(!encontre &&  plaza <  getPlazas()){
                piso=0;
                while(!encontre && piso < getPisos()){
                    if(this.autos[plaza][piso]!=null && this.autos[plaza][piso].getPatente() == patente){
                       auto="Auto encontrado en Piso: " + (piso+1) + " y Plaza: " + (plaza+1);
                       encontre=true; 
                    }
                    piso++;
                }
                plaza++;
            }
            if(!encontre){
                return "Auto Inexistente";
            }else{
            return auto;
            }
        } 
}
