//
//  Product.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let name: String?
    let price: Double?
    let brand: String?
    let image: String?
    let quantity: Int?
}
