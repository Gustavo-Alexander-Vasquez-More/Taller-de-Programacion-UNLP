/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
import PaqueteLectura.Lector;
public class Ejercicio5 {
    public static void main(String[] args){
        System.out.println("Ingresa el radio del circulo");
        double radio=Lector.leerDouble();
        Circulo circulo=new Circulo(radio);
        System.out.println("El área del circulo es: " + circulo.calcularArea());
        System.out.println("El perímetro del circulo es: " + circulo.calcularPerimetro());
    }
}
