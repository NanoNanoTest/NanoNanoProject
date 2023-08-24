////
////  PokemonGalerryView.swift
////  NanoNano
////
////  Created by Safik Widiantoro on 24/08/23.
////
//
//import SwiftUI
//
//struct PokemonGalerryView: View {
//    private let gridItems = [GridItem(.flexible()),
//        GridItem(.flexible())]
//    @StateObject var viewModel = PokemonViewModel()
//    
//    var body: some View {
//            ScrollView {
//                LazyVGrid(columns: gridItems){
//                    ForEach(viewModel.pokemonsGalerry)
//                    {
//                        pokemon in PokemonCell(pokemon: pokemon, viewModel: viewModel)
//                    }
//                }
//            }
//            .task {
//                viewModel.fetchPokemons()
//        }
//    }
//}
//
//struct PokemonGalerryView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonGalerryView()
//    }
//}
