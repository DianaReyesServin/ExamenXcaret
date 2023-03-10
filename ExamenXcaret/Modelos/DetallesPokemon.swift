//
//  DetallesPokemon.swift
//  ExamenXcaret
//
//  Created by Diana Reyes on 08/03/23.
//

import Foundation

struct detalleAPI: Codable{
    let height: Int
    let weight: Int
    let id: Int
    let name: String
    let stats: [stats]
    let types: [types]
}

struct stats: Codable{
    var base_stat: Int
}

struct types: Codable{
    var slot: Int
    var type: typess
}

struct typess: Codable{
    var name: String
}
