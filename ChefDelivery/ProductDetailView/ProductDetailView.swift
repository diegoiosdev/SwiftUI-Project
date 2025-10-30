//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    @State private var productQuantity = 1
    
    var body: some View {
        
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
                           
            Spacer()
            
            ProductDetailButtonView()
        }
    }
}

struct ProductDetailButtonView: View {
    var body: some View {
        Button {
            print(Self.self, #function)
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundStyle(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
