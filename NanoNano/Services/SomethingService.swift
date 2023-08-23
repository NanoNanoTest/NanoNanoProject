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
    func fetch() async throws -> APIResponseModel<String> {
        let url = URL(string: "http://something.com")
        do {
            let response: APIResponseModel<String> = try await service.fetch(APIResponseModel<String>.self, url: url)
            return response
        } catch {
            throw error
        }
    }
}
