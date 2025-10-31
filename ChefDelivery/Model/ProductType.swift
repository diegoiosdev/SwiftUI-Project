//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import Foundation

struct ProductType: Identifiable, Codable {
    
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}
