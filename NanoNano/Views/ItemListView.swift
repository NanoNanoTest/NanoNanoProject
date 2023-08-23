//
//  ItemListView.swift
//  NanoNano
//
//  Created by Adry Mirza on 23/08/23.
//

import SwiftUI

struct ItemListView: View {
    
    @StateObject var viewModel: PokemonViewModel = .init()
    @State var searchText: String = ""
    var pokemons: [PokemonModel]{
        return searchText.isEmpty ? viewModel.pokemons : viewModel.pokemons.filter({ pokemon in
            pokemon.name.lowercased().contains(searchText.lowercased())
        })
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(pokemons, id: \.url){pokemon in
                        NavigationLink(value: pokemon.url){
                            Text(pokemon.name)
                        }
                    }
                }
                .listStyle(.inset)
                .navigationDestination(for: String.self) { value in
                    ItemDetailView(url: value)
                }
                .navigationTitle("Home")
                .searchable(text: $searchText)
            }
            .padding()
        }
        .onAppear {
            Task {
                try await viewModel.fetchData()
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
