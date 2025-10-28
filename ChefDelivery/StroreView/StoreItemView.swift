//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 28/10/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50,  height: 50)
            
            VStack {
                Text(order.name)
                    .font(.subheadline)
                
            }
            
            Spacer()
        }
        .onTapGesture {
            print(Self.self, #function)
        }
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order: OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
