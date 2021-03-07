//
//  ProductViewCell.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/12/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductComplement: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnOffer: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var vwAdd: UIView!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    
    private var selectedProduct: Product!
    private var calculateNewQuantity: Bool = true
    
    private var hasOffer: Bool = false {
        didSet {
            if (hasOffer) {
                btnOffer.isHidden = !hasOffer
                btnOffer.setTitle("\(String(format: "%.2f", selectedProduct.discountRate))% de dcto.", for: .normal)
                lblPrice.textColor = .offer00CB2C
            }
        }
    }
    
    private var wantToAdd: Bool = true {
        didSet {
            if (wantToAdd) {
                vwAdd.isHidden = false
                btnAdd.isHidden = true
            } else {
                vwAdd.isHidden = true
                btnAdd.isHidden = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    private func setUI() {
        clipsToBounds = true
        layer.borderColor = UIColor.borderEFEFEF.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        addBorderToAddButton()
    }
    
    private func addBorderToAddButton() {
        vwAdd.clipsToBounds = true
        vwAdd.layer.borderColor = UIColor.redF96363.cgColor
        vwAdd.layer.borderWidth = 1
        vwAdd.layer.cornerRadius = 4
        vwAdd.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        imgProduct.clipsToBounds = true
        imgProduct.layer.cornerRadius = 4
        imgProduct.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        btnAdd.clipsToBounds = true
        btnAdd.layer.cornerRadius = 4
        btnAdd.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    private func validateQuantity(_ quantity: Int) {
        if (quantity >= 1 && quantity <= 10) {
            btnPlus.isEnabled = true
            calculateNewQuantity = true
        } else {
            if (quantity == 0) {
                wantToAdd = !btnAdd.isHidden
            } else {
                btnPlus.isEnabled = false
            }
            calculateNewQuantity = false
        }
    }
    
    func fill(with product: Product) {
        selectedProduct = product
        imgProduct.image = UIImage(named: selectedProduct.photo)
        lblProductName.text = selectedProduct.name
        lblProductComplement.text = selectedProduct.complement
        lblPrice.text = "S/. \(String(format: "%.2f", selectedProduct.price))"
        hasOffer = selectedProduct.hasOffer
    }
    
    @IBAction func allowAddProduct(_ sender: Any) {
        wantToAdd = !btnAdd.isHidden
    }
    
    @IBAction func removeProduct(_ sender: Any) {
        var quantity = Int(lblQuantity.text!)!
        quantity = quantity - 1
        validateQuantity(quantity)
        if (calculateNewQuantity) {
            lblQuantity.text = "\(quantity)"
        }
    }
    
    @IBAction func addProduct(_ sender: Any) {
        var quantity = Int(lblQuantity.text!)!
        quantity = quantity + 1
        validateQuantity(quantity)
        if (calculateNewQuantity) {
            lblQuantity.text = "\(quantity)"
        }
    }
}
