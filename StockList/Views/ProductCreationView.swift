//
//  ProductCreationView.swift
//  StockList
//
//  Created by Guilherme Feitosa on 04/12/23.
//

import SwiftUI

struct ProductCreationView: View {
    
    @State var product = Product()

    let productService = ProductService()
    let productDataService = ProductDataService()

    
    var body: some View {
        
        
        
        ZStack{
            
            Color(red: 0.51, green: 0.93, blue: 0.93)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Text("New Product")
                    .font(.system(size: 40))
                    .bold()
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
                                   let createResult = try await productService.createProduct(product: product)
                                    try productDataService.save(product: ProductData(id: createResult.id, name: createResult.name, price: createResult.price, brand: createResult.brand, image: createResult.image, quantity: createResult.quantity))
                                } catch {
                                    print (error.localizedDescription)
                                }
                            }
                        }, label: {
                            Text("Save").frame(maxWidth: .infinity, maxHeight: .infinity)
                               
                        })
                    )
                    .frame(height: 50)
                    .padding()
                
            }
        }
        
    }
    
    }


struct ProductCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCreationView()
    }
}
