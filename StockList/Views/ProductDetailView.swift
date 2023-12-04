//
//  ProductDetailView.swift
//  StockList
//
//  Created by Guilherme Feitosa on 04/12/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    //    let name: String?
    //    let price: Double?
    //    let brand: String?
    //    let image: String?
    //    let quantity: Int?
    
    @State var name = ""
    @State var price = 0.0
    @State var brand = ""
    @State var quantity = 0
    @State var image = ""
    @State var id = ""
    
    let productService = ProductService()
    
    var body: some View {
        
        
        
        ZStack{
            
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Spacer()
                AsyncImage(url:URL(string: image), content: { image in
                    image.resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {})
                .frame(width: 250, height: 250)
                Spacer()
                HStack(spacing: 20){
                    VStack (alignment: .leading, spacing: 10){
                        Text("Name: ")
                        TextField("Product name ", text: $name)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)
                    VStack (alignment: .leading, spacing: 10){
                        Text("Product price: ")
                        TextField("Price ", value: $price, format: .number)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                HStack(spacing: 20){
                    VStack (alignment: .leading, spacing: 10){
                        Text("Brand: ")
                        TextField("Product brand ", text: $brand)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)
                    VStack (alignment: .leading, spacing: 10){
                        Text("Quantity: ")
                        TextField("Quantity", value: $quantity, format: .number)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .overlay(
                        Button(action: {
                            Task {
                                do {
                                    try await productService.updateProduct(id: id, name: name, price: price, brand: brand, image: image, quantity: quantity)

                                } catch {
                                    print (error.localizedDescription)
                                }
                            }
                        }, label: {
                            Text("Save")
                        })
                    )
                    .frame(height: 50)
                    .padding()
                
            }
        }
        
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //        ProductDetailView(name: "Test", price: 10, brand: "Test", image: "lala", quantity: 5)
        ProductDetailView()
    }
}
