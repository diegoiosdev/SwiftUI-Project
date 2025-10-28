//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 28/10/25.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
        
    var body: some View {
        
        LazyHGrid(rows: gridLayout, spacing: 15) {
            ForEach(orderMock) { orderItem in
               OrderTypeView(orderType: orderItem)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct OrderTypeGridView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeGridView()
            .previewLayout(.sizeThatFits)
    }
}
