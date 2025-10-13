/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

import tema2.Persona;

public class Ejercicio3 {
    
    public static void main(String[] args) {
        
        Persona  persona=new Persona("Arturo", 256855, 70);
        Persona trabajador=new Trabajador("Jorge", 233654, 25, "albañil");
        
        System.out.println(persona.toString());
        System.out.println(trabajador.toString());
        
    }
    
}
