//
//  DataService.swift
//  StockList
//
//  Created by Guilherme Feitosa on 05/12/23.
//

import Foundation
import RealmSwift

struct DataService {
    
    static var realm: Realm?
    
    static func initializeRealm() {
        do {
            realm = try Realm()
            print("Database on")
        } catch {
            print("Database fail")
        }
    }
}
