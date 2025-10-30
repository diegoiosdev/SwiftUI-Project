//
//  StoreDetailHeaderView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 30/10/25.
//

import SwiftUI

struct StoreDetailHeaderView: View {
    
    var store: StoreType
    
    var body: some View {
        VStack {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Image(store.logoImage)
            }
            
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack {
                Text(store.location)
                
                ForEach(1...store.stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
}

struct StoreDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailHeaderView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
