//
//  NetworkLayerForProduct.swift
//  Homework1_M4
//
//  Created by Aziza A on 11/2/23.
//

import Foundation

final class NetworkLayerForProduct {
    static let shared = NetworkLayerForProduct()
    
    private init() { }
    
    func fetchProduct() throws -> [Product] {
        let decoder = JSONDecoder()
        let products = try decoder.decode([Product].self, from: Data(productJSON.utf8))
        return products
    }
}
