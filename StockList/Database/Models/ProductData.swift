//
//  ProductData.swift
//  StockList
//
//  Created by Guilherme Feitosa on 04/12/23.
//

import Foundation
import RealmSwift

var realm: Realm?

class ProductData: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""
    @Persisted var price: Double = 0.0
    @Persisted var brand: String = ""
    @Persisted var image: String = ""
    @Persisted var quantity: Int = 0
    
    convenience init(id: String, name: String, price: Double, brand: String, image: String, quantity: Int) {
        self.init()
        self.id = id
        self.name = name
        self.price = price
        self.brand = brand
        self.image = image
        self.quantity = quantity
    }
}

