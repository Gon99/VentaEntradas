

import Foundation
import UIKit

var entradasCompradas = [Evento]()

var nombreEvento = [String]()
var codigoEvento = [String]()
var precioEvento = [Int]()
var imagenesEvento = [#imageLiteral(resourceName: "eventos"), #imageLiteral(resourceName: "teatro"), #imageLiteral(resourceName: "cine"), #imageLiteral(resourceName: "realidad-virtual")]

func guardarEvento(){       //Guardamos todos los datos de un evento que queremos que se almacenen, estos datos los obtenemos del array entradasCompradas y los almacenamos en los arrays que creamos en los atributos
    
    nombreEvento.removeAll()
    codigoEvento.removeAll()
    precioEvento.removeAll()
    
    for i in entradasCompradas {
        nombreEvento.append(i.nombre)
    }
    UserDefaults.standard.set(nombreEvento, forKey: "nombreEvento")
    
    for i in entradasCompradas {
        codigoEvento.append(i.codigo)
    }
    UserDefaults.standard.set(codigoEvento, forKey: "codigoEvento")
    
    for i in entradasCompradas {
        precioEvento.append(i.precio)
    }
    UserDefaults.standard.set(precioEvento, forKey: "precioEvento")
}

func cargarEvento() {       //Cargamos todos los eventos  que hemos almacenado anteriormente por medio de las keys hacemos referencia a los datos guardados y los almacenamos
    if let nombreEventoCargar = UserDefaults.standard.array(forKey: "nombreEvento") {
        nombreEvento = nombreEventoCargar as! [String]
    }
    
    entradasCompradas.removeAll()
    if let codigoEventoCargar = UserDefaults.standard.array(forKey: "codigoEvento") {
        codigoEvento = codigoEventoCargar as! [String]
    }
    
    if let precioEventoCargar = UserDefaults.standard.array(forKey: "precioEvento") {
        precioEvento = precioEventoCargar as! [Int]
    }
    
    entradasCompradas.removeAll()
    
    if nombreEvento.count == 0 {
        return
    }

    for i in 0...nombreEvento.count - 1 {
        let evento = Evento(nombre: nombreEvento[i], imagen: #imageLiteral(resourceName: "eventos"), precio: precioEvento[i], codigo: codigoEvento[i])
        entradasCompradas.append(evento)
    }
    
    asignarImagenes()
}

func asignarImagenes() {        //Asignamos las imágenes del array imagenesEvento con las imágenes del array entradasCompradas accediendo a su imagen, todo esto a través de el nombre de los eventos
    for i in entradasCompradas {
        switch i.nombre {
        case "Nada":
            i.imagen = imagenesEvento[0]
            break
        case "Teatro":
            i.imagen = imagenesEvento[1]
            break
        case "Cine":
            i.imagen = imagenesEvento[2]
            break
        case "Realidad Virtual":
            i.imagen = imagenesEvento[3]
            break
        default:
            break
        }
    }
}




