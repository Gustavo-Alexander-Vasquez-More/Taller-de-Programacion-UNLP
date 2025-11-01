/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio3;

public class Ejercicio3 {

    public static void main(String[] args) {
        EventoOcasional evento=new EventoOcasional("show de TV", "jhon Doe", "10/5/2025", "the srtockes", 2);
        evento.agregarTema("Last Nite");
        evento.agregarTema("Reptilia");
        System.out.println("El costo del evento es $" + evento.calcularCosto());
        evento.actuar();
        Gira gira=new Gira("Arg tour", "Aerosmith", 3, 2);
        gira.agregarTema("Crazy");
        gira.agregarTema("Crying");
        gira.agregarTema("Jaded");
        Fecha fecha1=new Fecha("Buenos Aires", "11/05/2025");
        Fecha fecha2=new Fecha("La plata", "15/05/2025");
        gira.agregarFecha(fecha1);
        gira.agregarFecha(fecha2);
        System.out.println("El costo del evento es $" + gira.calcularCosto());
        gira.actuar();
        gira.actuar();
    }
    
}
