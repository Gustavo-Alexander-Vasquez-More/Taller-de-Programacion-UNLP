/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author phantomroot
 */
public class EventoOcasional extends Recital {
    private String motivo;
    private String contratante;
    private String diaEvento;
    
    //constructor

    public EventoOcasional(String motivo, String contratante, String diaEvento, String banda, int cantTemas) {
        super(banda, cantTemas);
        this.motivo = motivo;
        this.contratante = contratante;
        this.diaEvento = diaEvento;
    }
    
    //getters and setters

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    public void imprimirLeyenda(){
        if(getMotivo().equals("a beneficio")){
            System.out.println("Recuerden colaborar con " + getContratante());
        }else if(getMotivo().equals("show de TV")){
            System.out.println("Saludos amigos televidentes");
        }else{
            System.out.println("Un feliz cumpleaños para " + getContratante());
        }
    }
    
    public double calcularCosto(){
         if(getMotivo().equals("a beneficio")){
            return 0;
        }else if(getMotivo().equals("show de TV")){
            return 50000;
        }else{
            return 150000;
        }
    }
    
}
