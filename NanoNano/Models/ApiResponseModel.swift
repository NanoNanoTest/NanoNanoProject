//
//  ApiResponseModel.swift
//  NanoNano
//
//  Created by Muhammad Rezky on 23/08/23.
//

import Foundation

struct APIResponseModel<T: Codable>: Codable {
    let code: Int
    let status: String
    let data: T
}
