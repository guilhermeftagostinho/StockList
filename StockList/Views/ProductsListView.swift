//
//  ProductsListView.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import SwiftUI

struct ProductsListView: View {
    //    let products = [
    //        Product(id: "1", name: "name", price: 1, brand: "brand", image: "item1", quantity: 1),
    //        Product(id: "2", name: "item2", price: 2, brand: "item2", image: "item2", quantity: 2),
    //        Product(id: "3", name: "item3", price: 3, brand: "item3", image: "item3", quantity: 3)
    //    ]
    
    let productService = ProductService()
    @State var products : [Product] = []
    
    
    var body: some View {
        
        VStack{
            Text("Products")
                .font(.system(size: 30))
                .bold()
            List(products) { product in
                ProductRow(product: product)
                    .listRowInsets(EdgeInsets())
                    .swipeActions {
                        Button {
                            Task {
                                do {
                                    try await productService.deleteProduct(id: product.id)
                                } catch {
                                    print (error.localizedDescription)
                                }
                            }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                                
                        }
                            .tint(.red)
                    }
            }
            .listStyle(PlainListStyle())
            
            
            .scrollContentBackground(.hidden)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .overlay(
                    Button(action: {
                        
                    }, label: {
                        Text("Create new Product")
                    })
                )
                .frame(height: 50)
                .padding()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.51, green: 0.93, blue: 0.93))
        .onAppear(){
            Task {
                do {
                    products = try await productService.getProducts()
                } catch {
                    print (error.localizedDescription)
                }
            }
            
        }
    }
    
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView()
    }
}


