//
//  ItemListView.swift
//  NanoNano
//
//  Created by Adry Mirza on 23/08/23.
//

import SwiftUI

struct ItemListView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                SearchBarComponent(text: $searchText)
                    .padding(.bottom, 16)
                List{
                    ForEach(0..<7){_ in
                        NavigationLink(value: "abcd"){
                            Text("abcd")
                        }
                    }
                }
                .listStyle(.inset)
                .navigationDestination(for: String.self) { value in
                    ItemDetailView(name: value)
                }
                .navigationTitle("Home")
            }
            .padding()
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
