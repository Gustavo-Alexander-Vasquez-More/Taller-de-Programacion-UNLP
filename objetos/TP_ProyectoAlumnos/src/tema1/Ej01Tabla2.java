/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int num;
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        for (int i=0;i <DF ; i++) {
            num=GeneradorAleatorio.generarInt(12);
            tabla2[i]=2*num;
            System.out.println("2x" + num + "="+ tabla2[i]);
        }
    }
}
