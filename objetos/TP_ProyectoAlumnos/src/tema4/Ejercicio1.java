/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

public class Ejercicio1 {
    public static void main(String[] args) {
        Triangulo triangulo= new Triangulo("verde", "naranja", 25.5, 24, 32.7);
        Circulo circulo= new Circulo("azul", "rojo", 24.5);
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        triangulo.despintar(); circulo.despintar();
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
    }
}
