//
//  ProductsDetailViewModel.swift
//  TechTaste
//
//  Created by Maria Clara Dias on 17/06/25.
//

import Foundation

class ProductsDetailViewModel {
    //var productId: Int
    var productName: String
    var productDescripition: String
    var productFormattedPrice: String
    var productImage:String
    
    init(productId: Int, productName: String, productDescripition: String, productFormattedPrice: String, productImage: String) {
        //self.productId = productId
        self.productName = productName
        self.productDescripition = productDescripition
        self.productFormattedPrice = productFormattedPrice
        self.productImage = productImage
    }
}
