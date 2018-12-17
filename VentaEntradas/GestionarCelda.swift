
import UIKit

class GestionarCelda: UITableViewCell {     //Personalizamos las celdas que vamos a utilizar para almacenar la información que pasamos

    var codigoCelda = ""
    
    @IBOutlet weak var nombreEventoLabel: UILabel!
    @IBOutlet weak var imagenEventoImage: UIImageView!
    @IBOutlet weak var precioEntradaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
