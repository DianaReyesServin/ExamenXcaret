//
//  ListaPokemonesViewController.swift
//  ExamenXcaret
//
//  Created by Rodrigo Arango on 07/03/23.
//

import UIKit

class ListaPokemonesViewController: UIViewController {
    
    @IBOutlet weak var lblNombreUsuario: UILabel!
    
    @IBOutlet weak var pokemonesTableView: UITableView!
    
    @IBOutlet weak var btnCerrarSesion: UIButton!
    
    @IBAction func btnCerrar(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "usuario")
        UserDefaults.standard.set(nil, forKey: "password")
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)    }
    
    var listaPokemones = PokemonesAPI(count: 0, next: "", previous: "", results: [])
    
    var nombreUsuario:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombreUsuario.text = nombreUsuario

        let background = UIImage(named: "angryimg")
        self.view.backgroundColor = UIColor(patternImage: background!)
        
        ApiPokemon.apiPokemon.getPokemones{ data in
            self.listaPokemones = data
            DispatchQueue.main.async {
                self.pokemonesTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detalleSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "detalleSegue"){
            let indexPath = self.pokemonesTableView.indexPathForSelectedRow!
            let tableViewDetail = segue.destination as? DetallesPokemonViewController
            
            tableViewDetail!.celdaSeleccionada = indexPath.row + 1
            self.pokemonesTableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension ListaPokemonesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPokemones.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celdas = tableView.dequeueReusableCell(withIdentifier: "pokemonCell")
                else
        {
            return UITableViewCell()
        }
        
        let pokemones = listaPokemones.results
        let idPokemon: String = pokemones[indexPath.row].url.split(separator: "/").last?.description ?? "0"
        celdas.textLabel?.text = idPokemon + " " + pokemones[indexPath.row].name.uppercased()
        let imgPokemon = UIImage(named: String(indexPath.row+1))
        celdas.imageView?.image = imgPokemon
        return celdas
    }
}
