
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let eventos = ["Nada","Teatro", "Cine", "Realidad Virtual"]
    let imagenesEventos = [#imageLiteral(resourceName: "eventos"),#imageLiteral(resourceName: "teatro"),#imageLiteral(resourceName: "cine"),#imageLiteral(resourceName: "realidad-virtual")]
    var precios = [0, 8, 12, 20]
    var precio = 0
    var codigoValidacion = ""
    
    @IBOutlet weak var eventosPicker: UIPickerView!
    @IBOutlet weak var imagenVisualizada: UIImageView!
    @IBOutlet weak var comprarButton: UIButton!
    @IBOutlet weak var precioTotal: UILabel!
    @IBOutlet weak var numeroEntradas: UILabel!
    @IBOutlet weak var quitarEntradaBoton: UIButton!
    @IBOutlet weak var comprarButtonImagen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventosPicker.dataSource = self        //Asociamos los métodos del picker a los métodos que tenemos que crear
        self.eventosPicker.delegate = self          //cuando implementamos UIPickerViewDataSource UIPickerViewDelegate
        cargarEvento()                              //Con este método cargamos los datos gracias a la persistencia
        comprarButton.isEnabled = false             //Los botones de compra comienzan desactivados ya que la primera imagen no muestra nada y no se puede comprar nada
        comprarButtonImagen.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1        //El número de columnas que tiene el picker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return eventos.count        //Número de eventos que tendrá el picker
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return eventos[row]     //Asocia los eventos al picker

    }

    func generarCodigoValidacion(length: Int) -> String{        //Con este método generamos un string aleatorio que será el código que tendrá cada una de las entradas en la última vista
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(letters.characters.count)
        codigoValidacion = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = letters.index(letters.startIndex, offsetBy: randomNum)
            let newCharacter = letters[randomIndex]
            codigoValidacion += String(newCharacter)
        }
        return codigoValidacion

    }
    
    func calcularPrecioEntrada() {      //Calcula el precio a partir de el precio de cada entrada y el número
        precioTotal.text = "\(precio * Int(numeroEntradas.text!)!)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imagenVisualizada.image = imagenesEventos[row]      //Asocia las imagenes con el evento pulsado del picker
        precio = precios[row]       //Asociar precios a evento
        calcularPrecioEntrada()
        if imagenesEventos[row] == imagenesEventos[0] {
            comprarButton.isEnabled = false
            comprarButtonImagen.isEnabled = false
        } else {
            comprarButton.isEnabled = true
            comprarButtonImagen.isEnabled = true
        }
    }
    
    @IBAction func sumarEntrada(_ sender: UIButton) {       //Permite aumentar el número de entradas por medio de un botón
        if (Int(numeroEntradas.text!)! <= 24) {
            var aumentarEntrada = Int(numeroEntradas.text!)!
            aumentarEntrada += 1
            numeroEntradas.text = "\(aumentarEntrada)"
            calcularPrecioEntrada()
        } else {
            //No se pueden comprar más de 50 entradas
        }
        
    }
    
    @IBAction func quitarEntrada(_ sender: UIButton) {      //Permite disminuir el número de entradas por medio de un botón
        if (Int(numeroEntradas.text!)! >= 2) {
            var restarEntrada = Int(numeroEntradas.text!)!
            restarEntrada -= 1
            numeroEntradas.text = "\(restarEntrada)"
            precioTotal.text = "\(precio * Int(numeroEntradas.text!)!)"
            calcularPrecioEntrada()
        }else {
            //No se puede comprar menos de 0 entradas
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     //Pasar información a la siguiente pantalla
        generarCodigoValidacion(length: 10)
        let fila = eventosPicker.selectedRow(inComponent: 0)        //Celda que seleccionamos en el picker
        let eventoCompleto = Evento(nombre: eventos[fila], imagen: imagenVisualizada.image!, precio: Int(precioTotal.text!)!, codigo: codigoValidacion)
        entradasCompradas.append(eventoCompleto)
        guardarEvento()
    }
    
}

