//
//  PokemonHomeTest.swift
//  NanoNanoTests
//
//  Created by Safik Widiantoro on 24/08/23.
//

import XCTest
@testable import NanoNano

final class PokemonHomeTest: XCTestCase {
    private var pokemonViewModel: PokemonViewModel = .init()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiCall() async throws {
        try await pokemonViewModel.fetchData()
        print(pokemonViewModel.pokemons)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
