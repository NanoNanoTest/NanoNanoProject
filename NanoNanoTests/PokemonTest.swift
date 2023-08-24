//
//  PokemonTest.swift
//  NanoNanoTests
//
//  Created by Safik Widiantoro on 24/08/23.
//

import XCTest
@testable import NanoNano

final class PokemonTest: XCTestCase {
    private var pokemonViewModel: PokemonViewModel = .init()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// testFetchPokemonsData
    /// Scenario: Fetch All Pokemons
    /// Given: -
    /// When: fetchData() called
    /// Then: pokemons should not be empty
    func testFetchPokemonsData() async throws {
        try await pokemonViewModel.fetchData()
        XCTAssertFalse(pokemonViewModel.pokemons.isEmpty)
    }

    func testMemoryFetchPokemonsData() throws {
        // This is an example of a performance test case.
        measure(metrics: [XCTMemoryMetric()], block: {
            Task {
                try await pokemonViewModel.fetchData()
            }
        })
    }

    /// testFetchPokemonDetail
    /// Scenario: Fetch Pokemon Detail
    /// Given: URL for bulbasaur pokemon data
    /// When: fetchDetailData() called
    /// Then: pokemonDetail should not be nill, and pokemonDetail name should be bulbasaur
    func testFetchPokemonDetail() async throws {
        try await pokemonViewModel.fetchDetailData("https://pokeapi.co/api/v2/pokemon/1/")
        XCTAssertNotNil(pokemonViewModel.pokemonDetail)
        XCTAssertEqual(pokemonViewModel.pokemonDetail?.name, "bulbasaur")
    }
    
}
