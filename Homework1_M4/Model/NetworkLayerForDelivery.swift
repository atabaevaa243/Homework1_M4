//
//  NetworkLayerForDelivery.swift
//  Homework1_M4
//
//  Created by Aziza A on 10/2/23.
//

import Foundation

final class NetworkLayerForDelivery {
    static let shared = NetworkLayerForDelivery()
    
    private init() { }
    
    func fetchDelivery() throws -> [Delivery] {
        let decoder = JSONDecoder()
        let deliveries = try decoder.decode([Delivery].self, from: Data(deliveryJSON.utf8))
        return deliveries
    }
}
