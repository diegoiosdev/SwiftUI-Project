//
//  NavegationBar.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 27/10/25.
//

import SwiftUI

struct NavegationBar: View {
    
    var body: some View {
        HStack {
            Spacer()
            Button("Av Cristiano Machado, 4000") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundColor(.red)
            }
        }
    }
}

/// A visualização apenas que o compomente esta utilizando.

struct NavegationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavegationBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
