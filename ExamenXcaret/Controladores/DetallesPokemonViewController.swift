//
//  DetallesPokemonViewController.swift
//  ExamenXcaret
//
//  Created by Diana Reyes on 08/03/23.
//

import UIKit

class DetallesPokemonViewController: UIViewController {
    
    @IBOutlet weak var imgPokemon: UIImageView!
    
    @IBOutlet weak var lblNombrePokemon: UILabel!
    
    @IBOutlet weak var lblIdPokemon: UILabel!
    
    @IBOutlet weak var lblTipo1: UILabel!
    
    @IBOutlet weak var lblTipo2: UILabel!
    
    @IBOutlet weak var lblAltura: UILabel!
    
    @IBOutlet weak var lblPeso: UILabel!
    
    @IBOutlet weak var lblSalud: UILabel!
    
    @IBOutlet weak var lblAtaque: UILabel!
    
    @IBOutlet weak var lblDefensa: UILabel!
    
    @IBOutlet weak var lblAtaqueEspecial: UILabel!
    
    @IBOutlet weak var lblDefensaEspecial: UILabel!
    
    @IBOutlet weak var lblVelocidad: UILabel!
    
    var celdaSeleccionada : Int = 0

    var detalles = detalleAPI(height: 0, weight: 0, id: 0, name: "", stats: [], types: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImage(named: "angryimg")
        self.view.backgroundColor = UIColor(patternImage: background!)
        
        ApiPokemon.apiPokemon.getDetallePokemon(idPokemon: celdaSeleccionada){ data in
            self.detalles = data
            DispatchQueue.main.async {
                self.lblNombrePokemon.text = self.detalles.name.uppercased()
                self.lblIdPokemon.text = String(self.detalles.id)
                self.lblPeso.text = String(self.detalles.weight)
                self.lblAltura.text = String(self.detalles.height)
                let tipos = self.detalles.types
                self.lblTipo1.text = tipos[0].type.name.uppercased()
                if(tipos.count > 1){
                    self.lblTipo2.text = tipos[1].type.name.uppercased()
                }else{
                    self.lblTipo2.text = ""
                }
                let estadisticas = self.detalles.stats
                self.lblSalud.text = String(estadisticas[0].base_stat)
                self.lblAtaque.text = String(estadisticas[1].base_stat)
                self.lblDefensa.text = String(estadisticas[2].base_stat)
                self.lblAtaqueEspecial.text = String(estadisticas[3].base_stat)
                self.lblDefensaEspecial.text = String(estadisticas[4].base_stat)
                self.lblVelocidad.text = String(estadisticas[5].base_stat)
                
                let imgPokemon = UIImage(named: String(self.detalles.id))
                
                self.imgPokemon.image = imgPokemon
            }
        }
    }
}
