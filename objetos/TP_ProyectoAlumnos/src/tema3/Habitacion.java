/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

public class Habitacion {
    private double costoNoche;
    private boolean ocupada;
    private Cliente cliente;
    
    //constructores
    public Habitacion(){} //constructor vacio por si se necesita
    
    public Habitacion(double costoNoche){
        this.costoNoche=costoNoche;
        this.ocupada=false;
        this.cliente= null;
    }
    
    //getters and setters

    public double getCostoNoche() {
        return costoNoche;
    }

    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    //Metodo para Ingresar cliente
    public void ingresarCliente(String nombre, int DNI, int edad){
        this.ocupada=true;
        this.cliente=new Cliente(nombre, DNI, edad);
        System.out.println("Cliente agregado correctamente");
    }
    
}
