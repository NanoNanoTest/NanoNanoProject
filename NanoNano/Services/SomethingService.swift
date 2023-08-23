//
//  SomethingService.swift
//  NanoNano
//
//  Created by Muhammad Rezky on 23/08/23.
//

import Foundation

class SomethingService : ObservableObject{
    let service: APIServiceProtocol
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    // aku pake string buat sementara aja, bisa generic tergantung nanti
    func fetch() async throws -> PokemonResponse {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/")
        do {
            let response: PokemonResponse = try await service.fetch(PokemonResponse.self, url: url)
            return response
        } catch {
            throw error
        }
    }
    
//    func fetchDetail(url: String) async throws -> PokemonResponseDetail -> {
//        let url = URL(string: url)
//        do {
//            let response: PokemonResponse = try await service.fetch(PokemonResponse.self, url: url)
//            return response
//        } catch {
//            throw error
//        }
//    }
}
