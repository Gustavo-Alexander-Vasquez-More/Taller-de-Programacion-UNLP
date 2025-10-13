/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author phantomroot
 */
public abstract class Empleado {
    private String  nombre;
    private double sueldoBase;
    private int antiguedad; //en años 
    
    //constructor

    public Empleado(String nombre, double sueldoBase, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBase = sueldoBase;
        this.antiguedad = antiguedad;
    }
    
    //getters & setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBase() {
        return sueldoBase;
    }

    public void setSueldoBase(double sueldoBase) {
        this.sueldoBase = sueldoBase;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
    
    //metodos
    
    public double promedioPorAntiguedad(){
      return   this.getSueldoBase() * 0.10 * this.getAntiguedad();
    }
    
    public abstract double calcularEfectividad();
     
    public   double calcularSueldoACobrar(){
        return getSueldoBase() + this.promedioPorAntiguedad();
    };
    
    public String toString(){
        return "Nombre: " + this.nombre + ", Sueldo a cobrar: " + this.calcularSueldoACobrar() +  " ,Efectividad: " + this.calcularEfectividad();
    }
    
}
