//
//  ProductDetailView.swift
//  StockList
//
//  Created by Guilherme Feitosa on 04/12/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var product : Product
    let productService = ProductService()
    let productDataService = ProductDataService()
    
    var body: some View {
        
        ZStack{
            Color(red: 0.51, green: 0.93, blue: 0.93)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                
                Spacer()
                AsyncImage(url:URL(string: product.image), content: { image in
                    image.resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {})
                .frame(width: 250, height: 250)
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Image URL: ")
                    TextField("Image URL", text: $product.image)
                        .foregroundColor(.black)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack(spacing: 20){
                    VStack (alignment: .leading, spacing: 10){
                        Text("Name: ")
                        TextField("Product name ", text: $product.name)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)
                    VStack (alignment: .leading, spacing: 10){
                        Text("Product price: ")
                        TextField("Price ", value: $product.price, format: .number)
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
                        TextField("Product brand ", text: $product.brand)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)
                    VStack (alignment: .leading, spacing: 10){
                        Text("Quantity: ")
                        TextField("Quantity", value: $product.quantity, format: .number)
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
                                    let updateResult = try await productService.updateProduct(product: product)
                                    try productDataService.save(product: ProductData(id: updateResult.id, name: updateResult.name, price: updateResult.price, brand: updateResult.brand, image: updateResult.image, quantity: updateResult.quantity))
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
        ProductDetailView(product: Product(id: "", name: "", price: 1.1, brand: "", image: "", quantity: 2))
    }
}
