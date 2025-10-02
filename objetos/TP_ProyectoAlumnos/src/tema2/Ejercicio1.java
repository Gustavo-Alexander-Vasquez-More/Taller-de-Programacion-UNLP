/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;

/**
 *
 * @author phantomroot
 */
import PaqueteLectura.Lector;
public class Ejercicio1 {
    
    public static void main(String args[]){
        /*Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
        muestre en consola la representación de ese objeto en formato String. */
        System.out.println("--------------------------------------");
        System.out.println("Ingrese un nombre");
        String nombrePersona=Lector.leerString();
        System.out.println("Ingrese el numero de DNI");
        int dniPersona=Lector.leerInt();
        System.out.println("Ingrese la edad");
        int edadPersona=Lector.leerInt();
        
        Persona persona1=new Persona(nombrePersona, dniPersona, edadPersona); //Ya que el contructor de Persona es publico puedo instanciarlo desde otra clase
        System.out.println(persona1.toString());
        
    }
    
}
