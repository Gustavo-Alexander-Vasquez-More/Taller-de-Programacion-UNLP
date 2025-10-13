/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

import tema2.Persona;

public class Trabajador extends Persona{
    private String oficio;

    public Trabajador(String unNombre, int unDNI, int unaEdad, String oficio) {
        super(unNombre, unDNI, unaEdad);
        this.oficio=oficio;
    }

    public String getOficio() {
        return oficio;
    }

    public void setOficio(String oficio) {
        this.oficio = oficio;
    }
    
    public String toString(){
        return super.toString() + " Soy " + getOficio();
    }

}
