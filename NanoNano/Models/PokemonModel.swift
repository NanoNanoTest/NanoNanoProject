//
//  PokemonModel.swift
//  NanoNano
//
//  Created by Safik Widiantoro on 23/08/23.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [PokemonModel]
}

struct PokemonModel: Codable {
    let name: String
    let url: String
}

struct PokemonDetailModel: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Sprites: Codable {
    let frontDefault: String
    let backDefault: String
    let frontShiny: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        case frontShiny = "front_shiny"
    }
}

struct PokemonGalerryModel: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}
