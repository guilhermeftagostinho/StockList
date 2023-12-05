//
//  ProductRow.swift
//  StockList
//
//  Created by Guilherme Feitosa on 03/12/23.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    var body: some View {
        Rectangle()
            .fill(Color(red: 0.78, green: 0.93, blue: 0.93))
            .frame(height: 70)
            .overlay(
                HStack(spacing: 20){
                    AsyncImage(url:URL(string:"\(product.image )"), content: { image in
                        image.resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                    }, placeholder: {})
                    .frame(width: 60, height: 60)

                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("\(product.name )")
                            .bold()
                        Text("\(product.brand )")

                    }
                    Spacer()
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Quantity: \(product.quantity )")
                        Text("Price: \(String(format: "%.2f", product.price ))")
                    }
                        
                        
                }
                    .padding(.horizontal)
                    .padding(.vertical)
                
            )
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ProductRow(product: Product(id: "1", name: "name", price: 4, brand: "brand", image: "https://mercadoorganico.com/6398-large_default/banana-prata-organica-600g-osm.jpg", quantity: 3))
        }
    }
}
