//
//  StoreDetailProductView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 30/10/25.
//

import SwiftUI

struct StoreDetailProductView: View {
    
    let store: StoreType
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding(12)
            
            ForEach(store.products) { product in
                
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
                /// Criando um model
                ///  o $ é a binding a ligação
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

struct StoreDetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailProductView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
