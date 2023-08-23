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
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
    init(frontDefault: String) {
        self.frontDefault = frontDefault
    }
}
