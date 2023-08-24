//
//  PokemonViewModel.swift
//  NanoNano
//
//  Created by Safik Widiantoro on 23/08/23.
//

import Foundation
import SwiftUI


class PokemonViewModel: ObservableObject{
    @Published var pokemons: [PokemonModel] = []
    @Published var pokemonsGalerry: [PokemonGalerryModel] = []
    @Published var pokemonDetail: PokemonDetailModel?
    @Published var isLoading: Bool = false

    
    func fetchData() async throws {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        do {
            let data = try await SomethingService().fetch()
            self.pokemons = data.results
            self.isLoading = false
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchDetailData(_ url: String) async throws{
        DispatchQueue.main.async {
            self.isLoading = true
        }
        do{
            let data = try await SomethingService().fetchDetail(url: url)
            DispatchQueue.main.async {
                self.pokemonDetail = data
                self.isLoading = false
                print(url)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchPokemons(){
        
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([PokemonGalerryModel].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemonsGalerry = pokemon
            }
        }.resume()
    }
}

extension Data {
    
    func parseData(removeString string: String ) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString  = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil}
        return data
    }
}

extension PokemonViewModel {
    func backgroundColor( forType type: String ) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        default: return  .systemIndigo
        }
    }
}

