//
//  Extension+Double.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 29/10/25.
//

import Foundation

extension Double {
    
    func formatPrice() -> String {
        let formattedString =  String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
