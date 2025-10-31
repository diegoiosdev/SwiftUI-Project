//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import Foundation

struct StoreType: Identifiable, Codable {
    
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoImage = "logo_image"
        case headerImage = "header_image"
        case location
        case stars
        case products
    }
}
