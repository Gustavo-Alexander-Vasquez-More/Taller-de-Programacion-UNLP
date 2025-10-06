/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
 */

import PaqueteLectura.Lector;

public class Ejercicio1 {
  
    public static void main(String[] args){
        Triangulo triangulo=new Triangulo();
        System.out.println("Ingrese el valor del primer lado del triangulo");
        double lado1=Lector.leerDouble();
        System.out.println("Ingrese el valor del segundo del triangulo");
        double lado2=Lector.leerDouble();
        System.out.println("Ingrese el valor del tecer lado del triangulo");
        double lado3=Lector.leerDouble();
        triangulo.setLado1(lado1); triangulo.setLado2(lado2); triangulo.setLado3(lado3);
        System.out.println("El perimetro del triángulo es: " + triangulo.calcularPerimetro());
        System.out.println("El área del triágulo es: " + triangulo.calcularArea());
    }
    
}
