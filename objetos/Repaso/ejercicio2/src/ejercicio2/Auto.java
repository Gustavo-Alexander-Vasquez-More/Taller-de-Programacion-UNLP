/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio2;

public class Auto {
    private String propietario;
    private int patente;
    
    //constructor
    
    public Auto(){}

    public Auto(String propietario, int patente) {
        this.propietario = propietario;
        this.patente = patente;
    }
    
    //getters & setters

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }
    
    
}
