//
//  ApiPokemon.swift
//  ExamenXcaret
//
//  Created by Diana Reyes on 08/03/23.
//

import Foundation
import Alamofire

class ApiPokemon{
    
    static let apiPokemon =  ApiPokemon()
    
    func getPokemones(pokemon : @escaping(_ pokemones : PokemonesAPI) -> (Void)){
        let url = "https://pokeapi.co/api/v2/pokemon?limit=1010"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { respuesta in
            switch respuesta.result{
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode(PokemonesAPI.self, from: data!)
                    pokemon(jsonData)
                }
                catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getDetallePokemon(idPokemon : Int, detalle : @escaping(_ detalles : detalleAPI) -> (Void)){
        let value = String(idPokemon.self)
        let url = "https://pokeapi.co/api/v2/pokemon/" + value
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { respuesta in
            switch respuesta.result{
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode(detalleAPI.self, from: data!)
                    detalle(jsonData)
                }
                catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
