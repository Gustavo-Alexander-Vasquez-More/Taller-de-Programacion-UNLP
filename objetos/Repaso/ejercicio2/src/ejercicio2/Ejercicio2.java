/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio2;
import PaqueteLectura.Lector;
public class Ejercicio2 {

    public static void main(String[] args) {
        
        Estacionamiento estacionamiento=new Estacionamiento("hola", "alsina 2971", "9:00", "22:00", 3, 3);
        estacionamiento.registrarAuto(1, 3, "Jhon Doe", 26428);
        estacionamiento.registrarAuto(2, 1, "Jhon Doe", 05123);
        estacionamiento.registrarAuto(1, 2, "Jhon Doe", 12345);
        estacionamiento.registrarAuto(1, 1, "Jhon Doe", 54321);
        estacionamiento.registrarAuto(3, 1, "Jhon Doe", 25987);
        estacionamiento.registrarAuto(3, 2, "Jhon Doe", 19979);
        System.out.println("---------------ESTADO DEL ESTACIONAMIENTO-------------");
        System.out.println(estacionamiento.toString());
        System.out.println("---------------------------------------------------------------");
        System.out.println("Cantidad de autos en la plaza 1: " + estacionamiento.cantidadAutosPorPlaza(1) + " autos.");
        System.out.println("---------------BUSCADOR DE AUTOS POR PATENTE-----------------");
        System.out.println("Ingrese la patente del auto que desea buscar: ");
        int patente=Lector.leerInt();
        System.out.println("----Resultado-----");
        System.out.println(estacionamiento.encontrarAuto(patente));
    }
    
}
