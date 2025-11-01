package ejercicio3;

public abstract class Recital {
    private String banda;
    private String[] temas;
    private int contTemas=0;
    //constrcutor base

    public Recital(String banda, int cantTemas) {
        this.banda =banda;
        this.temas = new String[cantTemas];
        for(int i=0; i < cantTemas; i++){
            this.temas[i]=null;
        }
    }

    //getters and setters
    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public String[] getTemas() {
        return temas;
    }

    public int getContTemas() {
        return contTemas;
    }
    
    //metodos
    public void agregarTema(String nombreTema){
        if(getContTemas() < this.temas.length){
            this.temas[getContTemas()]=nombreTema;
            this.contTemas++;
        }else{
            System.out.println("Se ha alcanzado el maximo de temas por agregar");
        }
    }
    
    public String imprimirleyendaTemas(){
        String cadena="";
        for(int i=0; i < getContTemas(); i++){
            cadena+="y ahora tocaremos " + this.temas[i] + "\n";
        }
        return cadena;
    }
    
    public abstract void  imprimirLeyenda(); //cada clase hija lo implementa de manera diferente
    
    public void  actuar(){
        imprimirLeyenda();
        System.out.println(imprimirleyendaTemas());
    }
    
    public abstract double calcularCosto(); //las clases hijas definen su propio calculo
    
}
