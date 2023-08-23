//
//  ApiService.swift
//  NanoNano
//
//  Created by Muhammad Rezky on 23/08/23.
//

import Foundation

class APIService : APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?) async throws -> T {
        guard let url = url else {
            throw APIError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            throw APIError.badResponse(statusCode: response.statusCode)
        }
        
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(type, from: data)
            return result
        } catch {
            throw APIError.parsing(error as? DecodingError)
        }
    }
}
