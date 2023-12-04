//
//  ProductCreationView.swift
//  StockList
//
//  Created by Guilherme Feitosa on 04/12/23.
//

import SwiftUI

struct ProductCreationView: View {
    
    
    @State var name = ""
    @State var price = 0.0
    @State var brand = ""
    @State var quantity = 0
    @State var image = ""
    @State var id = ""
    
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


struct ProductCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCreationView()
    }
}
