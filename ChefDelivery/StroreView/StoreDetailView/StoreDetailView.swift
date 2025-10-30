//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading) {
                /// inicio da minha compomentização
                
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductView(store: store)
                
                }
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundStyle(Color("ColorRed"))
                    }
                }
            }
        }
    }


struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
