//
//  Pokemones.swift
//  ExamenXcaret
//
//  Created by Diana Reyes on 08/03/23.
//

import Foundation

struct PokemonesAPI: Codable{
    let count: Int
    let next: String
    let previous: String?
    let results: [results]
}

struct results: Codable{
    var name: String
    var url: String
}
