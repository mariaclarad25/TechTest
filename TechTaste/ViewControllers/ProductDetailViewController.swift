//
//  ProductDetailViewController.swift
//  TechTaste
//
//  Created by Maria Clara Dias on 16/06/25.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    //var productId: Int?
    
    var viewModel: ProductsDetailViewModel
    
    init(viewModel: ProductsDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productDetailImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: viewModel.productImage))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var titleProductLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.productName
        label.textColor = .mediumOrange
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var detailProductLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.productDescripition
        label.textColor = .gray3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var  priceProductLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.productFormattedPrice
        label.textColor = .gray3
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: AssetsConstants.backgroundColor)
        // Do any additional setup after loading the view.
        addSubviews()
        setupConstrains()
        //loadProductData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func addSubviews() {
        view.addSubview(productDetailImage)
        view.addSubview(titleProductLabel)
        view.addSubview(detailProductLabel)
        view.addSubview(priceProductLabel)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            productDetailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productDetailImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            productDetailImage.widthAnchor.constraint(equalToConstant: 342),
            productDetailImage.heightAnchor.constraint(equalToConstant: 240),
            
            titleProductLabel.topAnchor.constraint(equalTo: productDetailImage.bottomAnchor, constant: 20),
            titleProductLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            
            detailProductLabel.topAnchor.constraint(equalTo: titleProductLabel.bottomAnchor, constant: 18),
            detailProductLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            detailProductLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceProductLabel.topAnchor.constraint(equalTo: detailProductLabel.bottomAnchor, constant: 18),
            priceProductLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            priceProductLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    /*private func loadProductData() {
        guard let id = productId,
              let products = ProductsRepository.loadProducts(),
              let product = products.first(where: { $0.id == id }) else {
            print("Produto não encontrado")
            return
        }

        titleProductLabel.text = product.name
        detailProductLabel.text = product.description
        priceProductLabel.text = product.formattedPrice
        productDetailImage.image = UIImage(named: product.image)
    }*/
}
