//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Maria Clara Dias on 13/06/25.
//

import Foundation

class ProductsListViewModel {
    var products: [Product]  = []
    private var productsRepository: ProductsRepository
    
    init(productsRepository: ProductsRepository = ProductsRepository()) {
        self.productsRepository = productsRepository
    }
    
    func getAllProducts() {
        if let products = productsRepository.loadProducts() {
            self.products = products
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return products.count
    }
}
