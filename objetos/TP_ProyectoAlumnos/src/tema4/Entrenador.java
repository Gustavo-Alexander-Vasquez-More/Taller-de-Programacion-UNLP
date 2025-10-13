/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author phantomroot
 */
public class Entrenador extends Empleado{
    private int campeonatosGanados;
    
    //constructor

    public Entrenador(String nombre, double sueldoBase, int antiguedad, int campeonatosGanados) {
        super(nombre, sueldoBase, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    //getters & setters

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    //La efectividad del entrenador es el promedio de campeonatos ganados por año de antigüedad
        public double calcularEfectividad(){
            return getCampeonatosGanados()/this.getAntiguedad();
        }
        /*
        Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
        ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
        50.000$ si ha ganado más de 10 campeonatos). 
        */
        public double calcularSueldoACobrar(){
           double aCobrar=super.calcularSueldoACobrar();
           if(getCampeonatosGanados() >=1 && getCampeonatosGanados() < 5){
               return aCobrar + 5000;
           }else if(getCampeonatosGanados() >=5 && getCampeonatosGanados() < 11){
               return aCobrar + 30000;
           }else{
               return aCobrar + 50000;
           }
        }
}
