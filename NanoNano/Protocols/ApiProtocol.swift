//
//  ApiProtocol.swift
//  NanoNano
//
//  Created by Muhammad Rezky on 23/08/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?) async throws -> T
}
