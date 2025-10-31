//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Diego Fernando on 31/10/25.
//

import Foundation
import Alamofire

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
    
    func fetchDataWithAlamofire(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request("https://private-e66ca0-newobject.apiary-mock.com/home").responseDecodable(of: [StoreType].self) { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        
    }

    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "https://private-e66ca0-newobject.apiary-mock.com/home") else {
            return .failure(.invalidUrl)
        }
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
        
    }
}
