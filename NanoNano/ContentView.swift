//
//  ContentView.swift
//  NanoNano
//
//  Created by Muhammad Rezky on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    
    
    var body: some View {
       
        NavigationView{
            VStack{
                if viewModel.isLoading {
                    Text("Loading ...")
                } else {
                    Text("data found")
                    
                    List{
                        ForEach(viewModel.pokemons, id: \.url) { pokemon in
                            Text(pokemon.name).foregroundColor(.blue)
                        }
                    }.onAppear {
                        print(viewModel.pokemons)
                    }
                }
            }
        }
        .onAppear {
            Task {
                try await viewModel.fetchData()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


