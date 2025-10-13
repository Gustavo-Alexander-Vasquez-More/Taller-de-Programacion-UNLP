/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String). 
*/
public class Circulo {
    private double radio;
    private String background;
    private String borderColor;
    
    //Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
 
    public Circulo(double radio){
        this.radio=radio;
    }
    
    //getters and setters

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
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
    
    //metodos
    public double calcularPerimetro(){
        double diametro=this.radio * 2;
        return Math.PI * diametro;
    }
    
    public double calcularArea(){
        return Math.PI * this.radio * this.radio;
    }
}
