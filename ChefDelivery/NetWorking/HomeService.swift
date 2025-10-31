//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 31/10/25.
//

import Foundation

enum RequestError: Error {
    case invalidUrl
    case errorRequest(error: String)
}

struct HomeService {
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-e66ca0-newobject.apiary-mock.com/home") else {
            return .failure(.invalidUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
}
