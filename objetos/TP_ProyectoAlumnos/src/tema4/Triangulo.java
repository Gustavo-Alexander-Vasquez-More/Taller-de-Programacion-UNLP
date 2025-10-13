/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author phantomroot
 */
public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo( String unCR, String unCL, double lado1, double lado2, double lado3) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    //getters and setters

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    //metodos
    public double calcularArea(){
        double s=(double) ( getLado1() + getLado2() + getLado3() ) / 2;
        double resultado=s*(s - getLado1())*(s -  getLado2())*(s - getLado3()) ;
        double area=Math.sqrt(resultado);
        return area;
    }
    
    public double calcularPerimetro(){
        return getLado1() + getLado2() + getLado3();
    }
    
    public String  toString(){
        return " Datos del Triángulo :" + super.toString();
    }
    
}
