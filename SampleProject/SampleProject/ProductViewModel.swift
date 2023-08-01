//
//  ProductViewModel.swift
//  SampleProject
//
//  Created by Nadeem Ahmad on 01/08/23.
//

import Foundation

class ProductViewModel : ObservableObject {
    
    @Published var products:[Product]  = [Product]()
    
    
    func getProductData () {
        
        let url  =  URL(string: "https://dummyjson.com/products")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            do  {
                
                let responseObject = try JSONDecoder().decode(ProductDetail.self, from: data!)
                
                DispatchQueue.main.async {
                    self.products = responseObject.products
                }
                
                
            }
            catch {
                
            }
            
        }.resume()
    }

}


struct ProductDetail: Codable {
    let products: [Product]
}

struct Product: Codable,Identifiable,Hashable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}


struct ProductDetails {
    
    var detail:String;
    var imageUrl:String
    
    init(detail: String,imageUrl:String) {
        
        self.detail = detail
        self.imageUrl = imageUrl
    }
}
