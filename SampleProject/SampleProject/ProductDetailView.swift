//
//  ProductDetailView.swift
//  SampleProject
//
//  Created by Nadeem Ahmad on 01/08/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    var productDetails:ProductDetails
    
    var body: some View {
        
        VStack  {
            
            AsyncImage(url: URL(string: productDetails.imageUrl)) { image in
                
                image.resizable()
                    .scaledToFit()
                
            } placeholder: {
                
            }

            Text(productDetails.detail)
        }.padding()
            .navigationTitle("Product Detail")
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productDetails: ProductDetails(detail:"", imageUrl: ""))
    }
}
