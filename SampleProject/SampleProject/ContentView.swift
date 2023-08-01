//
//  ContentView.swift
//  SampleProject
//
//  Created by Nadeem Ahmad on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var productViewModel =  ProductViewModel()
    
    var body: some View {
        
       NavigationView {
           
           
           NavigationStack {
               List(productViewModel.products) { product in
                   NavigationLink(value: product) {
                       
                       HStack {
                           
                           
                           AsyncImage(url: URL(string: product.thumbnail)) { image in
                               
                               image.resizable()
                                   .scaledToFit()
                               
                           } placeholder: {
                               
                           }
                           
                           VStack(alignment:.leading) {
                               Text(product.title)
                               
                               Text(product.description)
                           }
                           
                       }.padding()
                       
                       // Text
                   }
               }
               .navigationDestination(for: Product.self) { product in
         
                   ProductDetailView(productDetails: ProductDetails(detail: product.description, imageUrl: product.thumbnail))
               }
           }.onAppear {
               productViewModel.getProductData()
               
           }
           .refreshable {
               productViewModel.getProductData()

                     }
       }.navigationTitle("Product List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
