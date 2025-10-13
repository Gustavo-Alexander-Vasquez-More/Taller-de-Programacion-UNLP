/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
import tema2.Persona;
public class Cliente extends Persona{
    
    //Constructores
    
    public Cliente(String nombre, int DNI, int edad){
        super(nombre , DNI, edad);
    }
    
    //metodos
    
    public String toString(){
        return "Cliente: " + this.getNombre() + ", DNI: " + this.getDNI() + ", edad: " + this.getEdad();
    }
    
}
