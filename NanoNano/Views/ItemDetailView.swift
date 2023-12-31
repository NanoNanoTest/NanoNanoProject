//
//  ItemDetailView.swift
//  NanoNano
//
//  Created by Adry Mirza on 23/08/23.
//

import SwiftUI

struct ItemDetailView: View {
    
    @State var url: String
    @StateObject var viewModel: PokemonViewModel = .init()
    
    var body: some View {
        VStack{
            Text(viewModel.pokemonDetail?.name ?? "")
                .accessibilityIdentifier("pokemonName")
            AsyncImage(url: URL(string: viewModel.pokemonDetail?.sprites.frontDefault ?? ""),scale: 0.5)
            AsyncImage(url: URL(string: viewModel.pokemonDetail?.sprites.backDefault ?? ""),scale: 0.5)
            AsyncImage(url: URL(string: viewModel.pokemonDetail?.sprites.backDefault ?? ""),scale: 0.5)
        }
        .onAppear(){
            Task {
                try await viewModel.fetchDetailData(_: url)
            }
        }
        .accessibilityIdentifier("itemDetailView")
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(url: "value")
    }
}
