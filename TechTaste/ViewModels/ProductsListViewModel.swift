//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Maria Clara Dias on 13/06/25.
//

import Foundation

class ProductsListViewModel {
    var products: Observable<[Product]> = Observable([])
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[ProductTableCellViewModel]> = Observable([])
    
    private var networkingManager: NetworkingManager
    
    init(networkingManager: NetworkingManager = NetworkingManager()) {
        self.networkingManager  = networkingManager
    }
    
    func getAllProducts() {
        isLoading.value = true
        networkingManager.getProductsList { [weak self] result in
            guard let self else {return}
            self.isLoading.value = false
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products.value = products
                    self.cellDataSource.value = products.compactMap({ product in
                        ProductTableCellViewModel(product: product)
                    })
                }
            case .failure(let failure):
                print ("Ocorreu um erro ao obter os produtos: \(failure.localizedDescription)")
            }
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return cellDataSource.value?.count ?? 0
    }
}
