
import UIKit



class GestionTabla: UITableViewController {
    
    @IBOutlet var listaEventos: UITableView!
    
    var nombreEvento = ""
    var imagenEvento = #imageLiteral(resourceName: "eventos")
    var precioEvento = 0
    var codigoValidacionEvento = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaEventos.rowHeight = 150
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {       //Asociamos el contenido de las celdas con la información que obtenemos de la clase ViewController
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! GestionarCelda
        celda.nombreEventoLabel.text = entradasCompradas[indexPath.row].nombre
        celda.imagenEventoImage.image = entradasCompradas[indexPath.row].imagen
        celda.precioEntradaLabel.text = String(entradasCompradas [indexPath.row].precio)
        celda.codigoCelda = entradasCompradas[indexPath.row].codigo
        return celda
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {      //Las casillas que tiene la tabla con respecto a los eventos que vayamos añadiendp
        return entradasCompradas.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     //Pasamos la información de esta vista a la siguiente que es DetalleEntrada
        let detalleEntrada = segue.destination as! DetalleEntrada
        let celdaPulsada = sender as! GestionarCelda
        detalleEntrada.nombreDetalleEntrada = celdaPulsada.nombreEventoLabel.text!
        detalleEntrada.imagenDetalleEntrada = celdaPulsada.imagenEventoImage.image!
        detalleEntrada.precioDetalleEntrada = Int(celdaPulsada.precioEntradaLabel.text!)!
        detalleEntrada.codigoDetalleEntrada = celdaPulsada.codigoCelda
    }
    
}
