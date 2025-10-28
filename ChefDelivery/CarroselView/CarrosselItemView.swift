//
// CarouselItemView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 28/10/25.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(order: OrderType(id: 1, name: "", image: "brazilian-meal-banner"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
