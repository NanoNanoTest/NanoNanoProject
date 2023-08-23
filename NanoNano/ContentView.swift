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
        ItemListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


