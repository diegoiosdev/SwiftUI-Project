//
//  HomeAppView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 27/10/25.
//

import SwiftUI

struct HomeAppView: View {
    
    // MARK: - Attributes
    
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true
        
    // MARK: - Views
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if isLoading {
                    ProgressView()
                } else {
                    NavegationBar()
                        .padding(.horizontal, 15)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await getStores()
            }
        }
        
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
            
        } catch {
            print(error.localizedDescription)
            self.isLoading = false
        }
    }
}

struct HomeAppView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAppView()
            .previewLayout(.sizeThatFits)
    }
}
