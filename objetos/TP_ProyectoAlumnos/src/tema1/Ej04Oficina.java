/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema1;

/**
 *
 * @author phantomroot
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej04Oficina {
 
    public static void main(String args[]){
    GeneradorAleatorio.iniciar();
    //Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso (1..4).
    //Definimos una matriz donde los pisos representan las columnas y las oficinas las filas
    int matriz[][]=new int[4][8];
    //variables
    int piso=0;
    int oficina;
    //La llegada de personas finaliza al indicar un nro. de piso 9
    while(piso <=8){
      System.out.println("Ingrese el piso"); piso=Lector.leerInt();
      System.out.println("Ingrese el numero de oficina"); oficina=Lector.leerInt();
      if(piso <=8 && oficina<=4){
      matriz[oficina - 1][piso - 1]+=1;
      }else{
          System.out.println("El numero de piso o oficina es incorrecto y no se pudo agregar a la matriz");
      }
    }
      //donde i representan las filas y j las columnas
     for(int i=0; i<4; i++){
       System.out.println("-----");
       for(int j=0; j<8; j++){
           if(matriz[i][j] >=1){
               System.out.print("( Piso " + (i+1) + ", oficina " + (j+1) + ") " + "Personas:" + matriz[i][j] + " | ");
           }else{
             System.out.print("( Piso " + (i+1) + ", oficina " + (j+1) + ") " + "Personas:"+ "0 | ");
           }
       }
     }
    }
    
}
