//
//  Detail.swift
//  NanoNano
//
//  Created by Safik Widiantoro on 23/08/23.
//

import SwiftUI

struct Detail: View {
    let pokemon: PokemonModel
    var body: some View {
        Text(pokemon.name)

//            .task {
//                fetchDetail(pokemon.url)
//            }

    }
}
