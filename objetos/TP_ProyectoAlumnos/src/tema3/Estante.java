/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author phantomroot
 */
public class Estante {
    private Libro[] libros;
    private boolean lleno;
    
    public Estante(){
        
    }

    public Estante(Libro[] libros, boolean lleno) {
        this.libros = libros;
        this.lleno = lleno;
    }
    
    //Getters & Setters

    public Libro[] getLibros() {
        return libros;
    }

    public void setLibros(Libro[] libros) {
        this.libros = libros;
    }

    public boolean isLleno() {
        return lleno;
    }

    public void setLleno(boolean lleno) {
        this.lleno = lleno;
    }
    
        
    
    //Metodos
    public int cantidadLibros(){
        int contador=0;
        for(int i=0; i < 20; i ++){
           if(this.libros[1] !=null){
             contador++;
           }
        }
        return contador;
    }
    
}
