//
//  Product.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    var name: String
    var price: Double
    var brand: String
    var image: String
    var quantity: Int
    
    init(id: String = "", name: String = "", price: Double = 0, brand: String = "", image: String = "", quantity: Int = 0) {
        self.id = id
        self.name = name
        self.price = price
        self.brand = brand
        self.image = image
        self.quantity = quantity
    }
    
    init(productData: ProductData) {
        self.id = productData.id
        self.name = productData.name
        self.price = productData.price
        self.brand = productData.brand
        self.image = productData.image
        self.quantity = productData.quantity
    }
}
