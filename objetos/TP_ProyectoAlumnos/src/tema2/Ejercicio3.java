package tema2;

import PaqueteLectura.Lector;

public class Ejercicio3 {
    
   public static void main(String[] args){
      //Definimos una matriz de 8x5 (5 dias represenetan las columnas, 8 cada turno del dia)
     Persona[][] entrevistas= new Persona[8][5];
     int[]  vectorEntrevistasPorDia=new int[5]; 
     //Declaramos las variables de lectura
     String nombre;
     int DNI;
     int edad;
     int dia=0;
     int turno;
     int contEntrevistados=0;
     for(int diaE=0; diaE < 5; diaE ++){  //inicializo el vector
         vectorEntrevistasPorDia[diaE]=0;
     }
     /*a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
     nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
    personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
    siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
    40 cupos de casting.*/
     //Leemos el nombre
     System.out.println("Ingrese el nombre del entrevistado:");
     nombre=Lector.leerString();
     while(!nombre.equals("ZZZ") &&  dia < 5){
         turno=0;
         while(!nombre.equals("ZZZ") && turno < 8){
           System.out.println("Ingrese el N° de DNI:");
           DNI=Lector.leerInt();
           System.out.println("Ingrese la edad:");
           edad=Lector.leerInt();
           entrevistas[turno][dia]=new Persona(nombre, DNI, edad);
           turno++;
           vectorEntrevistasPorDia[dia]+=1;
         }
         dia++;
         System.out.println("Ingrese el nombre del entrevistado:");
          nombre=Lector.leerString();
     }
     /*
     b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
     */
    for(int diaE=0; diaE < 5; diaE ++){  //EStos son los dias del vector
      if(vectorEntrevistasPorDia[diaE] > 0){ //Si el dia del vector hubo almenos 1 entrevistado recorre
          for(int i=0; i < vectorEntrevistasPorDia[diaE]; i++){
              System.out.println("Día " + (diaE + 1) + ", Nombre del entrevistado: " + entrevistas[i][diaE].getNombre());
          }
      }
    }
   }
}
