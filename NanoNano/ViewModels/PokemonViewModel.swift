//
//  PokemonViewModel.swift
//  NanoNano
//
//  Created by Safik Widiantoro on 23/08/23.
//

import Foundation


class PokemonViewModel: ObservableObject {
    @Published var pokemons: [PokemonModel] = []
    @Published var pokemonDetail: PokemonDetailModel?
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

    func fetchDetailData(_ url: String) async throws{
        isLoading = true
        do{
            let data = try await SomethingService().fetchDetail(url: url)
            DispatchQueue.main.async {
                self.pokemonDetail = data
                self.isLoading = false
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
