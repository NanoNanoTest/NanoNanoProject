//
//  ItemDetailView.swift
//  NanoNano
//
//  Created by Adry Mirza on 23/08/23.
//

import SwiftUI

struct ItemDetailView: View {
    
    @State var name: String
    var body: some View {
        Text(name)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(name: "value")
    }
}
