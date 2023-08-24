////
////  PokemonCell.swift
////  NanoNano
////
////  Created by Safik Widiantoro on 24/08/23.
////
//
//import SwiftUI
//
//struct PokemonCell: View {
//
//    let pokemon: PokemonGalerryModel
//    let viewModel: PokemonViewModel
//    @State private var image: UIImage?
//
//
//    var body: some View {
//        ZStack {
//            VStack(alignment: .leading) {
//                Text(pokemon.name.capitalized)
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding(.top, 4)
//                    .padding(.leading)
//                HStack {
//                    Text(pokemon.type)
//                        .font(.subheadline).bold()
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 8)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(Color.white.opacity(0.25))
//                        )
//                        .frame(width: 100, height: 24)
//
//
//                    AsyncImage(url: URL(string: pokemon.imageUrl), scale: 4)
//
//                }
//            }
//        }
//        .background(Color(viewModel.backgroundColor(forType: pokemon.type)))
//        .cornerRadius(12)
//        .shadow(color: Color(viewModel.backgroundColor(forType: pokemon.type)), radius: 6, x: 0.0, y: 0.0)
//    }
//
//
//}
