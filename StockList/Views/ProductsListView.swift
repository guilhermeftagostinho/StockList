//
//  ProductsListView.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import SwiftUI

struct ProductsListView: View {
    
    let productService = ProductService()
    @State var products : [Product] = []
    let productDataService = ProductDataService()
    
    var body: some View {
        NavigationView{
            VStack{
                List(products) { product in
                    ZStack{
                        NavigationLink(destination: ProductDetailView(product: product), label: {
                            EmptyView()
                        })
                        ProductRow(product: product)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .swipeActions {
                        Button {
                            Task {
                                do {
                                    try await productService.deleteProduct(id: product.id)
                                    try productDataService.delete(id: product.id)
                                    let productDataResult = productDataService.getProducts()
                                    self.products = productDataResult.map({Product(productData: $0)})
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
                .navigationBarTitle(Text("Products"))
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .overlay(
                        NavigationLink(destination: {
                            ProductCreationView()
                        }, label: {
                            Text("Create new Product")
                        })
                    )
                    .frame(height: 50)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.51, green: 0.93, blue: 0.93))
            .onAppear{
                Task {
                    do {
                        let products = try await productService.getProducts()
                        let productsData = products.map({ProductData(product: $0)})
                        try productDataService.save(products: productsData)
                    } catch {
                        print (error.localizedDescription)
                    }
                    let productDataResult = productDataService.getProducts()
                    self.products = productDataResult.map({Product(productData: $0)})
                }
            }
        }
    }
    
    struct ProductsListView_Previews: PreviewProvider {
        static var previews: some View {
            ProductsListView()
        }
    }
}
