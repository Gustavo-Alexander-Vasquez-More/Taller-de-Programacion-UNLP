/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
            int i, j;
            int sumaFila1=0;
        //Paso 2. iniciar el generador aleatorio     
            GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
           int  matriz [] [] = new int [5] [5];
           for(i=0; i < 5; i++){
               for(j=0; j<5; j ++)
                   matriz[i][j]=GeneradorAleatorio.generarInt(100);
           }
        //Paso 4. mostrar el contenido de la matriz en consola
            for(i=0; i< 5; i++){
                for(j=0; j<5; j ++)
                    System.out.print("(" + i + ","  + j  + ") " + matriz[i][j] + " | ");
                     System.out.println("-");
            }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
            for(i=0; i < 5; i++)
               sumaFila1=sumaFila1 +  matriz[0][i];
            System.out.println("La suma de los elementos de la fila 1 de la matriz es: " + sumaFila1);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
            int [] vector=new int[5];
           for (j = 0; j < 5; j++) { // j es la columna
              for (i = 0; i < 5; i++) { // i es la fila
                vector[j] += matriz[i][j];
              }
           }
            System.out.println("----vector-----");
            for(i=0; i<5; i ++)
                System.out.println("Suma Columna" +  i + ": " + vector[i] + ", ");
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
           System.out.println("----------------");
           System.out.println("Ingrese un numero entero desde teclado: ");
           int value=Lector.leerInt();
           int fila=0;
           int col=0;
           i=0;
           boolean encontre=false;
           while (i < 5 && !encontre) {
             j = 0;
             while (j < 5 && !encontre) {
               if (matriz[i][j] == value) {
                 encontre = true;
                 fila = i;
                 col = j;
               }
               j++;
             }
             i++;
           }           
           if(encontre){
               System.out.println("La posicion del valor encontrado en la matriz es:" + "(" + fila + "," +  col +")");
           }else{
               System.out.println("No se encontro el elemento");
           }
    }
}
