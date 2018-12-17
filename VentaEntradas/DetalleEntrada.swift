
import UIKit

class DetalleEntrada: UIViewController {

    var nombreDetalleEntrada = ""
    var imagenDetalleEntrada = #imageLiteral(resourceName: "eventos")
    var precioDetalleEntrada = 0
    var codigoDetalleEntrada = ""
    
    @IBOutlet weak var nombreDetalleEntradaLabel: UILabel!
    @IBOutlet weak var imagenDetalleEntradaImage: UIImageView!
    @IBOutlet weak var precioDetalleEntradaLabel: UILabel!
    @IBOutlet weak var codigoDetalleEntradaLabel: UILabel!
    
    override func viewDidLoad() {       //La información que hemos obtenido de la clase GestionTabla la visualizamos en esta pantalla nada más carge
        super.viewDidLoad()
        
        nombreDetalleEntradaLabel.text = nombreDetalleEntrada
        imagenDetalleEntradaImage.image = imagenDetalleEntrada
        precioDetalleEntradaLabel.text = String(precioDetalleEntrada)
        codigoDetalleEntradaLabel.text = codigoDetalleEntrada
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
