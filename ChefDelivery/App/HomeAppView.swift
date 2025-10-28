//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 27/10/25.
//

import SwiftUI

struct HomeAppView: View {
    var body: some View {
        VStack {
            NavegationBar()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    OrderTypeGridView()
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeAppView()
}
