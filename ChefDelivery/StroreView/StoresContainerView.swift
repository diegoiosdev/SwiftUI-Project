//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 28/10/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                
                Menu("Filtrar") {
                    
                    ForEach(1...5, id: \.self) { rating in
                        
                        Button {
                            //
                        } label: {
                            Text("\(rating) estrelas ou mais")
                        }
                    }
   
                }
                .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                ForEach(storesMock) { mock in
                    
                    NavigationLink {
                        StoreDetailView(store: mock)
                    } label: {
                        StoreItemView(store: mock)
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
        StoresContainerView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
