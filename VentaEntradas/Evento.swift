
import UIKit
import Foundation

class Evento : NSObject {       //Clase evento la cual tiene como atributos los datos con los que queremos trabajar, nombre, imagen, precio y codigo
    
    var nombre : String
    var imagen : UIImage
    var precio : Int
    var codigo : String
    
    init(nombre : String, imagen : UIImage, precio : Int, codigo : String) {        //método constructor para iniciliazar los atributos de las clase evento
        self.nombre = nombre
        self.imagen = imagen
        self.precio = precio
        self.codigo = codigo
    }
}

