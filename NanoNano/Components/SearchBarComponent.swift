//
//  SearchBarComponent.swift
//  NanoNano
//
//  Created by Adry Mirza on 23/08/23.
//

import SwiftUI

struct SearchBarComponent: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $text)
                .foregroundColor(.primary)
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 40)
        .background(Color(.systemGray5))
        .cornerRadius(10)
    }
}
