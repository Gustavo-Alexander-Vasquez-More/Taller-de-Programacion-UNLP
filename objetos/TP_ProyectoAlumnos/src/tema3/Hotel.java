/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
   Habitacion[] habitaciones; //tiene un arreglo de habitaciones
   
   //constructor
   public Hotel(int cantHabitaciones){
       GeneradorAleatorio.iniciar();
       //vamos a dar el tamaño al arreglo de habitaciones
       this.habitaciones=new Habitacion[cantHabitaciones];
       //A cada habitacion le ponemos el precio aleatorio
       for(int i=0; i < cantHabitaciones; i ++){
           this.habitaciones[i]=new Habitacion(GeneradorAleatorio.generarDouble(8000 - 2000 + 1) + 2000); //en cada posicion del arreglo creamos una habitacion y la iniciamos con precio aleatorio
        }
   }
   
   //Getters
   
   public Habitacion[] getHotel(){
       return habitaciones;
   }
   
   //metodos
   public void ingresarClienteHabitacion(String nombre, int DNI, int edad, int x){
       this.habitaciones[x - 1].ingresarCliente(nombre, DNI, edad);
   }
   
   public void aumentarPrecioHabitaciones(double monto){
       for(int i=0; i < this.habitaciones.length; i++){
          double nuevoPrecio=habitaciones[i].getCostoNoche() + monto;
          habitaciones[i].setCostoNoche(nuevoPrecio);
       }
   }
   
   public void infoHotel(){
       for(int i=0; i < this.habitaciones.length; i++){
           if(this.habitaciones[i].isOcupada()){ //si esta ocupada
               System.out.println("Habitacion " + (i+1) + ", Costo: $" + habitaciones[i].getCostoNoche()  + ", Ocupada por " + habitaciones[i].getCliente().toString());
           }else{
               System.out.println("Habitacion " + (i + 1) + ", Costo: $" + habitaciones[i].getCostoNoche()  + ": Desocupada");
           }
       }
   }
   
}
