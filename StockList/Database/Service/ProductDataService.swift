//
//  ProductDataService.swift
//  StockList
//
//  Created by Guilherme Feitosa on 04/12/23.
//

import Foundation
import RealmSwift


struct ProductDataService {
    
    func getProducts() -> [ProductData] {
        if let results = DataService.realm?.objects(ProductData.self) {
            var products: [ProductData] = []
            products.append(contentsOf: results)
            return products
        }
        return []
    }
    
    func save(products: [ProductData]) throws {
        for product in products {
            try save(product: product)
        }
    }
    
    func save(product: ProductData) throws {
        try DataService.realm?.write {
            DataService.realm?.add(product, update: .modified)
        }
    }
    
    func delete(id: String) throws {
        if let result = DataService.realm?.object(ofType: ProductData.self, forPrimaryKey: id){
            try DataService.realm?.write {
                DataService.realm?.delete(result)
            }
        }
    }
    
    
    
    
    
    
}
