/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema1;
/**
 *
 * @author phantomroot
 */
import PaqueteLectura.Lector;
public class Ej05Restaurante {
    public static void main(String args[]){
        int puntaje;
        //Estructura de puntajes
        int [] vectorPuntajes=new int [4];
        //Inicializamos el vector acumulador depuntajes
        for(int i=0; i<4; i++){
           vectorPuntajes[i]=0;
        }
        //Realizamos la entrevista a los 5 clientes y si en caso algunos elijen el mismo puntaje e va acumulando
        for(int i=0; i<5; i++){
            System.out.println("Cliente " + (i+1)  + ", elija una puntuacion del 1 al 10  para cada aspecto: 0[atencion al cliente], 1[calidad de la comida], 2[precio], 3[ambiente]");
           for(int j=0; j<4; j ++){
               System.out.println("Ingrese la puntuacion que considere para el aspecto " + j +":");
               puntaje=Lector.leerInt();
               vectorPuntajes[j]+=puntaje;
           }
        }
        //obtener la calificacion promedio de cada aspecto
        for(int i=0; i<4; i++)
            System.out.println("El promedio de puntaje para el aspecto " + i + " es : " + (double) vectorPuntajes[i] / 5);
    }
}
