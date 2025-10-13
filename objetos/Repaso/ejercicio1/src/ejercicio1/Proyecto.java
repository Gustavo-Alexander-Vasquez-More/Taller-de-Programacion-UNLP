/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author phantomroot
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] investigadores;
    private int contInvestigadores=0;
    
    //constructor

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores=new Investigador[50];
    }
    
    //getters and setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    public int getContInvestigadores() {
        return contInvestigadores;
    }

    public void setContInvestigadores(int contInvestigadores) {
        this.contInvestigadores = contInvestigadores;
    }

    //metodos
    public void agregarInvestigador(Investigador unInvestigador){
       if(getContInvestigadores() < 50){
           investigadores[getContInvestigadores()]=unInvestigador;
           this.contInvestigadores++;
       }else{
           System.out.println("Se supero el limite maximo de investigadores por proyecto");
       }
    }
    
    public double dineroTotalOtorgado(){
        double suma=0;
        for(int i=0; i < getContInvestigadores(); i++){
            suma+=this.investigadores[i].calcularTotalSubsidioOtorgado();
        }
        return suma;
    }
    
    public String toString(){
        String cadenaInvestigadores="";
        for(int i=0; i < getContInvestigadores(); i++){
            cadenaInvestigadores+=this.investigadores[i].toString();
        }
        return "Proyecto: " + getNombre() + ", Codigo: " + getCodigo() + ",  Nombre del director: " + getNombreDirector() + "Dinero total otorgado: $" + dineroTotalOtorgado() + "\nInformación de los investigadores : " + cadenaInvestigadores;
    }
}
