//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 28/10/25.
///  site do servidor: https://app.apiary.io/newobject/editor

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    var stores: [StoreType]
    
    @State private var ratingFilter = 0
    
    var filterStores: [StoreType] {
        /// caso o servidor der problema, na linha 19 eu mando o mock.
        return stores.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                
                Menu("Filtrar") {
                    
                    Button {
                        ratingFilter = 0 
                    } label: {
                        Text("limpar Filtro")
                    }
                    
                    Divider()
            
                    ForEach(1...5, id: \.self) { rating in
                        
                        Button {
                         ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
   
                }
                .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filterStores.isEmpty {
                    Text("Ops! Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filterStores) { mock in
                        
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                    
                }
            }
            .foregroundStyle(.black)
        }
        .padding(20)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView(stores: storesMock)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
