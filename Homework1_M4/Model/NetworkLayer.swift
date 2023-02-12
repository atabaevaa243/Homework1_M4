//
//  NetworkLayer.swift
//  Homework1_M4
//
//  Created by Aziza A on 10/2/23.
//

import Foundation

final class NetworkLayer {
    static let shared = NetworkLayer()
    
    private init() { }
    
    func fetchCategory() throws -> [Category] {
        let data = Data(categoryJSON.utf8)
        return try decode(data)
    }
    
    func fetchDelivery() throws -> [Delivery] {
        let data = Data(deliveryJSON.utf8)
        return try decode(data)
    }

    func fetchProduct() throws -> [Product] {
        let data = Data(productJSON.utf8)
        return try decode(data)
    }
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
