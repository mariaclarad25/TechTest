//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Maria Clara Dias on 13/06/25.
//

import Foundation

class ProductsListViewModel {
    var products: [Product]  = []
    private var networkingManager: NetworkingManager
    
    init(netwoekingManager: NetworkingManager = NetworkingManager()) {
        self.networkingManager  = netwoekingManager
    }
    
    func getAllProducts() {
        networkingManager.getProductsList { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                }
            case .failure(let failure):
                print ("Ocorreu um erro ao obter os produtos: \(failure.localizedDescription)")
            }
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return products.count
    }
}
