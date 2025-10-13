/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio4 {
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        Reporte reporte1=new Reporte(2021, 3, "La Plata", -34.921, -57.955);
        reporte1.cargarTodo();  //carga todas las temperaturas
        System.out.println(reporte1.promedioAnios());
        System.out.println(reporte1.mayorTemperatura());
        Reporte reporte2=new Reporte(2020, 4, "Mar del Plata", -38.002, -57.556);
        reporte2.cargarTodo(); //carga todas las temperaturas
        System.out.println(reporte2.promedioPorMes());
        System.out.println(reporte2.mayorTemperatura());
        
    }
}
