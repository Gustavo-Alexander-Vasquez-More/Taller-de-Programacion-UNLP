/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

public class Ejercicio4Hotel {
    
    public static void main(String[] args){
        //instanciar hotel
        Hotel hotel=new Hotel(25);
        hotel.ingresarClienteHabitacion("Alex more", 958424, 22, 1);
        hotel.ingresarClienteHabitacion("Eddie veder", 651646, 46, 2);
        hotel.ingresarClienteHabitacion("Jhon Doe", 5656, 78, 15);
        hotel.ingresarClienteHabitacion("Jhon Ceena", 5656, 78, 5);
        hotel.ingresarClienteHabitacion("Elton Jhon", 5656, 78, 6);
        hotel.ingresarClienteHabitacion("Jimi hendrix", 5656, 78, 12);
        hotel.ingresarClienteHabitacion("Frank Sinatra", 5656, 78, 20);
        hotel.ingresarClienteHabitacion("Steve vai", 5656, 78, 25);
        hotel.ingresarClienteHabitacion("Luisito comunica", 5656, 78, 17);
        System.out.println("----------------------------------------------");
        hotel.infoHotel();
        hotel.aumentarPrecioHabitaciones(500); //aumenta el precio de las habitaciones en $500
        System.out.println("----------------------------------------------");
        hotel.infoHotel();
    }
}
