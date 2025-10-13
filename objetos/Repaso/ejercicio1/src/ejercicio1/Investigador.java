/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author phantomroot
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int contSubsidios=0;
    
    //constructor

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios=new Subsidio[5];
    }
    
    //getters and setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getContSubsidios() {
        return contSubsidios;
    }

    public void setContSubsidios(int contSubsidios) {
        this.contSubsidios = contSubsidios;
    }
    
    
    //metodos
    public void agregarSubsidio(Subsidio unSubsidio){
        if(getContSubsidios() < 5){
           subsidios[getContSubsidios()]=unSubsidio;
           this.contSubsidios++;
       }else{
           System.out.println("Se supero el limite maximo de subsidios por  investigador");
       }
    }
    
    public double calcularTotalSubsidioOtorgado(){
        double suma=0;
        for(int i=0; i < getContSubsidios(); i++){
            if(this.subsidios[i].isOtorgado()){
                suma+=this.subsidios[i].getMontoPedido();
            }
        }
        return suma;
    }
    
    public void otorgarTodos(){
        for(int i=0; i < getContSubsidios(); i++){
            if(!this.subsidios[i].isOtorgado()){
                this.subsidios[i].setOtorgado(true);
            }
       }
    }
    
    public String toString(){
        return "\nInvestigador: " + getNombre() + ", Categoria: " + getCategoria() + ", Especialidad: " + getEspecialidad() + ", Monto total de subsidios otorgados: " + calcularTotalSubsidioOtorgado();
    }
    
}
