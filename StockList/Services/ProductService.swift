//
//  ProductService.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import Foundation

class ProductService {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "http://54.207.173.246:8090/api/collections/product/records") else {
            throw ServiceError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(ProductResponse.self, from: data)
        
        return decodedData.items
    }
    
    func createProduct() async throws -> Product {
        guard let url = URL(string: "http://54.207.173.246:8090/api/collections/product/records") else {
            throw ServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let product = Product(id: "", name: "test", price: 15, brand: "test", image: "ssdds", quantity: 2)
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(product)
        
        request.httpBody = encodedData
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let (data,_) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Product.self, from: data)
        
        return decodedData
    }
    
    func deleteProduct(id: String) async throws {
        guard let url = URL(string: "http://54.207.173.246:8090/api/collections/product/records/\(id)") else {
            throw ServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        _ = try await URLSession.shared.data(for: request)
    }
    
    func updateProduct(id: String) async throws -> Product {
        guard let url = URL(string: "http://54.207.173.246:8090/api/collections/product/records/\(id)") else {
            throw ServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        let product = Product(id: "", name: "testupdated", price: 15, brand: "testupdated", image: "ssdds", quantity: 2)
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(product)
        
        request.httpBody = encodedData
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let (data,_) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Product.self, from: data)
        
        return decodedData
    }
    
    
}
