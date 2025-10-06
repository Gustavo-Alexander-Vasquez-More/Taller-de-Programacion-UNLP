/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String background; //color de relleno del triangulo
    private String borderColor; //color de la linea

        public Triangulo(){}
    public Triangulo(double lado1, double lado2, double lado3, String background, String borderColor) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.background = background;
        this.borderColor = borderColor;
    }
    
    //Getters & Setters

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

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getBorderColor() {
        return borderColor;
    }

    public void setBorderColor(String borderColor) {
        this.borderColor = borderColor;
    }
    
    public double calcularPerimetro(){
        double perimetro=this.lado1 + this.lado2 + this.lado3;
        return perimetro;
    }
    public  double calcularArea(){
        double s=(double) (this.lado1 + this.lado2 + this.lado3)/2;
        double resultado=s*(s - this.lado1)*(s - this.lado2)*(s - this.lado3) ;
        double area=Math.sqrt(resultado);
        return area;
    }
    
}
