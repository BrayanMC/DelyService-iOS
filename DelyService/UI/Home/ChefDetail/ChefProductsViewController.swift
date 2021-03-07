//
//  ProductsChefViewController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/12/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

final class ChefProductsViewController: UIViewController, InstantiableController {
    
    @IBOutlet weak var imgPresentation: UIImageView!
    @IBOutlet weak var vwChefInformation: UIView!
    @IBOutlet weak var lblChefName: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblChefAddress: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var cvProducts: UICollectionView!
    
    var chef: Chef!
    var selectedProduct: Product!
    
    private var chefProductsViewModel = ChefProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        showData()
        bind()
        
        chefProductsViewModel.loadProducts(products: chef.products)
    }
    
    private func setUI() {
        vwChefInformation.clipsToBounds = true
        vwChefInformation.layer.borderColor = UIColor.borderEFEFEF.cgColor
        vwChefInformation.layer.borderWidth = 1
        vwChefInformation.layer.cornerRadius = 4
        vwChefInformation.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        btnSave.adjustsImageWhenHighlighted = false
        
        cvProducts.register(ProductViewCell.self)
        cvProducts.dataSource = self
        cvProducts.delegate = self
    }
    
    private func showData() {
        imgPresentation.image = UIImage(named: chef.picture)
        markOrUnmarkPresentation(state: chef.availability)
        lblRating.text = chef.rating
        lblChefAddress.text = chef.address
        lblDistance.text = chef.distance
    }
    
    private func bind() {
        chefProductsViewModel.showProducts.delegate(to: self) { (self, products) in
            debugPrint("Products: \(products)")
            self.cvProducts.reloadData()
        }
        
        chefProductsViewModel.showProductDetail = { product -> Void in
            debugPrint("Product name is \(product.name)")
            self.selectedProduct = product
        }
    }
    
    private func markOrUnmarkPresentation(state: Bool) {
        if (state) {
            btnSave.changeImage(image: .notSaved)
            btnSave.tag = 0
        } else {
            btnSave.changeImage(image: .save)
            btnSave.tag = 1
        }
    }
    
    static func instance() -> ChefProductsViewController {
        return StoryBoardManager.default.initViewController(from: .chefProducts, with: .chefProductsViewController) as! ChefProductsViewController
    }
    
    @IBAction func backTo(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savePresentation(_ sender: UIButton) {
        markOrUnmarkPresentation(state: sender.tag == 1)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension ChefProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chefProductsViewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productItem = collectionView.dequeueCell(forIndexPath: indexPath) as ProductViewCell
        productItem.fill(with: chefProductsViewModel.products[indexPath.row])
        return productItem
    }
}

extension ChefProductsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chefProductsViewModel.showProductDetail!(chefProductsViewModel.products[indexPath.row])
    }
}

extension ChefProductsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 20.0, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
}
