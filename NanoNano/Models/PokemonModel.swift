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
