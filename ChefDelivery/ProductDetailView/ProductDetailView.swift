//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    var service = HomeService()
    
    @State private var productQuantity = 1
    
    var body: some View {
        
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
                           
            Spacer()
            
            ProductDetailButtonView {
                Task {
                    await confirmOrder()
                }
            }
        }
    }
    
    /// metodo assincrono
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription) /// Neste caso real eu crio uma tela de erro para informar para o usuário o que esta acontecendo
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button {
            onButtonPress()
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Enviar pedido")
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
