/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author phantomroot
 */
public class Jugador extends Empleado{
    private int partidosJugados;
    private int golesAnotados;
    
    //constructor

    public Jugador( String nombre, double sueldoBase, int antiguedad, int partidosJugados, int golesAnotados) {
        super(nombre, sueldoBase, antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }
     
    //getters & setters

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    //metodos
    //l jugador es el promedio de goles por partido.
    public double calcularEfectividad(){
        return getGolesAnotados()/getPartidosJugados();
    }
    
     public double calcularSueldoACobrar(){
           double aCobrar=super.calcularSueldoACobrar();
           if(calcularEfectividad() > 0.5){
               return aCobrar * 2;
           }else{
               return aCobrar;
           }
        }
    
    }
