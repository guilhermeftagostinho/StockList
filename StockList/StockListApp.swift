//
//  StockListApp.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import SwiftUI
import RealmSwift

@main
struct StockListApp: SwiftUI.App {
    
    init () {
        DataService.initializeRealm()
    }
    
    var body: some Scene {
        WindowGroup {
            ProductsListView()
        }
    }
}
