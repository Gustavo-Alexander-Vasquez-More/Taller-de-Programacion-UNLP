
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;

public class Ej02Jugadores {
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
           double [] vector;
        //Paso 3: Crear el vector para 15 double 
            vector=new double[15];
        //Paso 4: Declarar indice y variables auxiliares a usar
           int i;
           double altura;
           double suma=0;
           double promedio;
           int cant=0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
           for(i=0; i <15; i++ ){
               System.out.println("Ingrese la altura de jugador " + i + ":" );
               altura=Lector.leerDouble();
               vector[i]=altura;
               suma+= altura;
           } 
        //Paso 7: Calcular el promedio de alturas, informarlo
           promedio=(double) suma/15 ;
            System.out.println("El promedio de las alturas ingresadas es: " + promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
            for(i=0; i <15; i++){
                if(vector[i] > promedio)
                    cant+=1;
            }
        //Paso 9: Informar la cantidad.
           System.out.println("La cantidad de alturas por encima del promedio fueron: " + cant);
    }
}
