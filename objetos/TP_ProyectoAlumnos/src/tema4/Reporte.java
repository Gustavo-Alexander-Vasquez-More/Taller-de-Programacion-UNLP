/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

import PaqueteLectura.GeneradorAleatorio;

public class Reporte {
   private int anioInicial;
   private int anioFinal;
   private int cantAnios;
   private Estacion estacion;
   private double valorMaximo=9999;
   private double[][] temperaturas;
  
  //constructor
   public Reporte(int anioInicial, int cantAnios, String nombre, double latitud, double longitud){
       this.anioInicial=anioInicial;
       this.cantAnios=cantAnios;
      this.estacion= new Estacion(nombre, latitud, longitud);
       this.temperaturas=new double[cantAnios][12];
       this.anioFinal=anioInicial + cantAnios - 1;
       for(int  anios=0; anios < cantAnios; anios++){
           for(int meses=0; meses < 12; meses++){
               this.temperaturas[anios][meses]=valorMaximo;
           }
       }
   }
   
   //getters and setters

    public int getAnioInicial() {
        return anioInicial;
    }

    public void setAnioInicial(int anioInicial) {
        this.anioInicial = anioInicial;
    }

    public int getCantAnios() {
        return cantAnios;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }

    public double[][] getTemperaturas() {
        return temperaturas;
    }

    public void setTemperaturas(double temperatura, int mes, int anio) {
        this.temperaturas[anio - getAnioInicial()][mes - 1] = temperatura;
    }
   
    public int getAnioFinal(){
        return anioFinal;
    }
    //metodos
    
    public void registrarTemperatura(double temperatura, int mes, int anio){
        if(anio <= getAnioFinal() && anio >= getAnioInicial() && mes<=12 && mes >=1){
            setTemperaturas(temperatura, mes, anio);
        }else{
            System.out.println("La cantidad de años o mes no es correcta");
        }
    }
    
    public double obtenerTemperatura(int mes, int anio){
         if(anio <= getAnioFinal() && anio >= getAnioInicial() && mes<=12 && mes >=1){
             return this.temperaturas[anio - getAnioInicial()][mes - 1];
         }else{
             return valorMaximo;
         }
    } 
     /*
    Devolver un String que concatena el mes y año en que se registró la mayor
    temperatura. Nota: Suponga que ya están registradas las temperaturas de todos
    los meses y años.
    */
    public String mayorTemperatura(){
        int maxAnio=0;
        int maxMes=0;
        double maxTemp=-99999;
        for(int anio=0; anio < getCantAnios(); anio ++){
            for(int mes=0; mes < 12; mes++){
                if(this.temperaturas[anio][mes] > maxTemp){
                    maxAnio=anio;
                    maxMes=mes;
                    maxTemp=this.temperaturas[anio][mes];
                }
            }
        }
        int realAnio=getAnioInicial() + maxAnio;
         int realMes=maxMes + 1;
        return "El mes y año con mayor temperatura fue: " + "(" +  realMes + "," + realAnio + ")";
    }
        
    public String promedioAnios(){
        String cadena="";
        double suma;
        for(int anio=0; anio < getCantAnios(); anio++){
             suma=0;
            for(int mes=0; mes < 12; mes++){
               suma+=obtenerTemperatura(mes + 1, getAnioInicial() +anio);
            }
            cadena+="- Año " + (getAnioInicial() + anio) + ": " + (double) suma/12 + "°C" + "\n";
        }
        return this.estacion.toString() + cadena;
    }
    
    public String promedioPorMes(){
         String cadena="";
         String[] meses=new String[12];
         meses[0]="Enero";  meses[1]="Febrero";  meses[2]="Marzo";  meses[3]="Abril";  meses[4]="Mayo";  meses[5]="Junio";  meses[6]="Julio";  meses[7]="Agosto";  meses[8]="Septiembre"; meses[9]="Octubre";  meses[10]="Noviembre";  meses[11]="Diciembre";
        double suma;
        for(int mes=0; mes < 12; mes++){
             suma=0;
            for(int anio=0; anio < getCantAnios(); anio++){
               suma+=obtenerTemperatura(mes + 1, getAnioInicial() +anio);
            }
            cadena+="-  " + meses[mes] + ": " + (double) suma/getCantAnios() + "°C" + "\n";
        }
        return this.estacion.toString() + cadena;
    }
    
    public void cargarTodo(){
        double temp;
        for(int anio=0; anio < getCantAnios(); anio++){
            for(int mes=0; mes < 12; mes++){
                temp=GeneradorAleatorio.generarDouble((45 + 5) + 1) - 5;
                registrarTemperatura(temp, mes + 1, getAnioInicial() +anio);
            }
        }
    }
    
}
