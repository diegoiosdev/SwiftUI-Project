//
//  HomeAppView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 27/10/25.
//

import SwiftUI

struct HomeAppView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                NavegationBar()
                    .padding(.horizontal, 15)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
    }
}

struct HomeAppView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAppView()
            .previewLayout(.sizeThatFits)
    }
}
