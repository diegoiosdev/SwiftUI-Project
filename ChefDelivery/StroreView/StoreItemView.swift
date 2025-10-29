//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 28/10/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50,  height: 50)
            
            VStack {
                Text(store.name)
                    .font(.subheadline)
                
            }
            
            Spacer()
        }
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
       StoreItemView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
