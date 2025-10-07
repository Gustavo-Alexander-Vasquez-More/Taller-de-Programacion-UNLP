/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

public class Ejercicio3 {
    
    public static void main(String[] args){
        Estante estante=new Estante(5); //Inicializo el estante para que guarde 5 libros como maximo
        Autor autor1=new Autor("Manuel Borgues", "loreipsumdolor", "Argentina");
        Autor autor2=new Autor("Eddie vedder", "loreipsumdolor", "USA");
        Autor autor3=new Autor("García marquez", "loreipsumdolor", "Colombia");
        Libro libro1=new Libro("Hola mundo", "planeta", 2020, autor3, "ISBN55222455852", 24.50);
        estante.agregarLibro(libro1);
        Libro libro2=new Libro("Mujercitas", "planeta", 2020, autor2, "ISBN55222455852", 24.50);
        estante.agregarLibro(libro2);
        Libro libro3=new Libro("XD", "planeta", 2020, autor1, "ISBN55222455852", 24.50);
        estante.agregarLibro(libro3);
        Libro libro4=new Libro("Into the wild", "planeta", 2020, autor2, "ISBN55222455852", 24.50);
        estante.agregarLibro(libro4);
        
        //buscar el libro mujercitas e informar el autor
        Libro infoLibro=estante.buscarLibro("Mujercitas");
        if(infoLibro !=null){
            System.out.println("El autor de este libro es: " + infoLibro.getPrimerAutor());
        }else{
            System.out.println("No se ha encontrado un libro con ese titulo");
        }
        
    }
    
}
