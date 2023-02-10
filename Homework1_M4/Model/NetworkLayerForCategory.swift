//
//  NetworkLayerForCategory.swift
//  Homework1_M4
//
//  Created by Aziza A on 10/2/23.
//

import Foundation

final class NetworkLayerForCategory {
    static let shared = NetworkLayerForCategory()
    
    private init() { }
    
    func fetchCategory() throws -> [Category] {
        let decoder = JSONDecoder()
        let categories = try decoder.decode([Category].self, from: Data(categoryJSON.utf8))
        return categories
    }
}
