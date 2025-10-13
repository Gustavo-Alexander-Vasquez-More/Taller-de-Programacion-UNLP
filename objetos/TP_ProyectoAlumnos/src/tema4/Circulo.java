/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author phantomroot
 */
public class Circulo extends Figura{
    private double radio;

    public Circulo(String unCR, String unCL, double radio) {
        super(unCR, unCL);
        this.radio = radio;
    }
    
    //getters and setters

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    //metodos
    
    public double calcularArea(){
        return Math.PI * (getRadio() * getRadio());
    }
    
    public double calcularPerimetro(){  
        return Math.PI * 2 * getRadio();
    }
    
    public String  toString(){
        return " Datos del circulo :" + super.toString();
    }
    
}
