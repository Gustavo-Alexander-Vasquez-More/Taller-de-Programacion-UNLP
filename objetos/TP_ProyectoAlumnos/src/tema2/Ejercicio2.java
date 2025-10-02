/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;

/**
 *
 * @author phantomroot
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio2 {
    /*
    2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
    15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
    obtener edad 0. Luego de almacenar la información:
    - Informe la cantidad de personas mayores de 65 años.
    - Muestre la representación de la persona con menor DNI.
    */
        public static void main(String args[]){
            GeneradorAleatorio.iniciar();
            int dimL=0;
            int dniPersona;
            int edadPersona;
            String nombrePersona;
            int cantMayores=0;
            int min=550;
            int posMenorDNI=0;
            Persona[] personas=new Persona[15];
            edadPersona=GeneradorAleatorio.generarInt(9);
                while(dimL < 15 && edadPersona!=0){
                    dimL++;
                    nombrePersona=GeneradorAleatorio.generarString(15);
                    dniPersona=GeneradorAleatorio.generarInt(500);
                    personas[dimL-1]=new Persona(nombrePersona, dniPersona, edadPersona);
                    edadPersona=GeneradorAleatorio.generarInt(81);
                }
           for(int i=0; i < dimL; i++){
               if(personas[i].getEdad() > 65)
                   cantMayores+=1;
               if(personas[i].getDNI() < min){
                   min=personas[i].getDNI();
                   posMenorDNI=i;
               }
           }
           if(dimL > 0){
               System.out.println("La cantidad de personas mayores a 65 fue: " + cantMayores);
                System.out.println("La persona con menor dni fue: " + personas[posMenorDNI].toString());
           }else
               System.out.println("No se encontraron personas");
        }
}
