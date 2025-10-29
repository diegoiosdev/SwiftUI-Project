//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    
    var body: some View {
        Text(store.name)
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
