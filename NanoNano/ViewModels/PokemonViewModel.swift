//
//  PokemonViewModel.swift
//  NanoNano
//
//  Created by Safik Widiantoro on 23/08/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemons: [PokemonModel] = []
    @Published var isLoading: Bool = false
    
    func fetchData() async throws {
        isLoading = true
        do {
            let data = try await SomethingService().fetch()
            DispatchQueue.main.async {
                self.pokemons = data.results
                self.isLoading = false
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
