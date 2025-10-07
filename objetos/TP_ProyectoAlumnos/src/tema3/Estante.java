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
    
    public Estante(int cantMaxima) {
        // Inicializa el vector de 20 libros
        this.libros = new Libro[cantMaxima];
    }

    public Estante(Libro[] libros) {
        this.libros = libros;
    }
    
    //Getters & Setters

    public Libro[] getLibros() {
        return libros;
    }

    public void setLibros(Libro[] libros) {
        this.libros = libros;
    }
    
    //Metodos
    public int cantidadLibros(){
        int contador=0;
        for(int i=0; i < this.libros.length; i ++){
           if(this.libros[i] !=null){
             contador++;
           }
        }
        return contador;
    }
    
    public boolean estaLleno(){
           return cantidadLibros() == this.libros.length;
    }
    
    public void agregarLibro(Libro libro){
        int cantLibros=cantidadLibros();
        if(cantLibros < this.libros.length){
            this.libros[cantLibros]=libro;
            System.out.println("Se ha agregado un libro exitosamente");
        }else{
            System.out.println("No se pueden agregar más libros porque el vector esta lleno");
        }
    }
    
    public Libro buscarLibro(String titulo){
        int cantLibros=cantidadLibros();
        int pos=0;
        while(pos < cantLibros){
            if(this.libros[pos].getTitulo().equals(titulo)){
                return this.libros[pos];
            }
                pos++;
        }
        return null;
    }
    
}
