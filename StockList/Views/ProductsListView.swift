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
                                    if let index = products.firstIndex(where: {$0.id == product.id}){
                                        products.remove(at: index)
                                    }
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
                        print("onappear")
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
    
}
