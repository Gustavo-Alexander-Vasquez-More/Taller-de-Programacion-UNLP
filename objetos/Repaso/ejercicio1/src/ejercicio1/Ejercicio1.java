/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio1;

public class Ejercicio1 {

    public static void main(String[] args) {
       Proyecto proyecto=new Proyecto("Proyecto 1", 78964, "Jhon Doe");
       Investigador investigador1=new Investigador("Sheldon Cooper", 5, "Físico teórico");
       Investigador investigador2=new Investigador("Leonard Hofstadter", 2, "Físico experimental");
       Investigador investigador3=new Investigador("rajesh koothrappali", 1, "Astrofísico");
       proyecto.agregarInvestigador(investigador1);
       proyecto.agregarInvestigador(investigador2);
       proyecto.agregarInvestigador(investigador3);
       Subsidio subsidio1=new Subsidio(500, "para lo que se requiera");
       Subsidio subsidio2=new Subsidio(1500, "para lo que se requiera");
       investigador1.agregarSubsidio(subsidio1);
       investigador1.agregarSubsidio(subsidio2);
       Subsidio subsidio3=new Subsidio(700, "para lo que se requiera");
       Subsidio subsidio4=new Subsidio(1700, "para lo que se requiera");
       investigador2.agregarSubsidio(subsidio3);
       investigador2.agregarSubsidio(subsidio4);
       Subsidio subsidio5=new Subsidio(200, "para lo que se requiera");
       Subsidio subsidio6=new Subsidio(1200, "para lo que se requiera");
       investigador3.agregarSubsidio(subsidio5);
       investigador3.agregarSubsidio(subsidio6);
       investigador2.otorgarTodos();
        System.out.println(proyecto.toString());
    }
    
}
