/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author phantomroot
 */
public class Gira  extends Recital{
    private String nombreGira;
    private Fecha[] fechasGira;
    private int numFechaActual;
    private int cantFechas=0;
    
    //constructor

    public Gira(String nombreGira, String banda, int cantTemas, int cantFechas) {
        super(banda, cantTemas);
        this.nombreGira = nombreGira;
        this.fechasGira = new Fecha[cantFechas];
    }
    
    //getters & setters

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getFechasGira() {
        return fechasGira;
    }

    public void setFechasGira(Fecha[] fechasGira) {
        this.fechasGira = fechasGira;
    }

    public int getNumFechaActual() {
        return numFechaActual;
    }

    public void setNumFechaActual(int numFechaActual) {
        this.numFechaActual = numFechaActual;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }
    
    
    //metodos
    public void agregarFecha(Fecha unaFecha){
       if(getCantFechas() < this.fechasGira.length){
         this.fechasGira[getCantFechas()] = unaFecha;
         this.cantFechas++;
        } else {
            System.out.println("Se ha excedido el maximo de fechas en la gira");
        }
    }
    
    public void imprimirLeyenda(){
        if(getNumFechaActual() < this.cantFechas){
            System.out.println("Buenas noches " + this.fechasGira[getNumFechaActual()].getCiudad());
            this.numFechaActual++;
        }else{
            System.out.println("No hay mas fechas de giras por mostrar");
        }
    }
    
    public double calcularCosto(){
        return 30000 * this.fechasGira.length;
    }
    
}
