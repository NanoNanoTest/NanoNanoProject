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
    @State var isImageShowed: Bool = false
    @State var url: String = ""
    
    
    
    var pokemons: [PokemonModel]{
        return searchText.isEmpty ? viewModel.pokemons : viewModel.pokemons.filter({ pokemon in
            pokemon.name.lowercased().contains(searchText.lowercased())
        })
    }
    var body: some View {
        NavigationStack{
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .controlSize(.large)
                        .accessibilityIdentifier("loadingIndicator")
                } else {
                    //MARK: LIST
                    List {
                        ForEach(pokemons, id: \.url){ pokemon in
                            NavigationLink(value: pokemon.url) {
                                Text(pokemon.name)
                                    .accessibilityIdentifier("pokemonName")
                            }
                            .accessibilityIdentifier("navigationLink")
                        }
                        
                        .listStyle(.inset)
                        .navigationDestination(for: String.self) { value in
                            ItemDetailView(url: value)
                        }
                        .navigationTitle("Pokemon")
                        .searchable(text: $searchText)
                        .autocorrectionDisabled(true)
                        .accessibilityIdentifier("scrollViewItem")
                    }//: LIST
                    .accessibilityIdentifier("scrollView")
                }
            }
        }.task {
            do {
                try await viewModel.fetchData()
            } catch {
                
            }
        }.accessibilityIdentifier("navigationStack")
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
