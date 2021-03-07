//
//  ChefPresentationViewCell.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/7/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit
import MapKit

class ChefPresentationViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgChefPhoto: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblChefName: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    private var selectedChef: Chef!
    
    private var isAvailabe: Bool = true {
        didSet {
            if (!isAvailabe) {
                lblState.alpha = 0.5
                lblState.text = "Cerrado"
            } else {
                lblState.alpha = 1
                lblState.text = "Abierto"
            }
        }
    }
    
    private var isMarked: Bool = true {
        didSet {
            if (!isMarked) {
                btnLike.changeImage(image: .heartDeselected)
                btnLike.tag = 0
            } else {
                btnLike.changeImage(image: .heartSelected)
                btnLike.tag = 1
            }
        }
    }
    
    private var isSaved: Bool = true {
        didSet {
            if (!isSaved) {
                btnSave.changeImage(image: .notSaved)
                btnSave.tag = 0
            } else {
                btnSave.changeImage(image: .save)
                btnSave.tag = 1
            }
        }
    }
    
    var shareInfo: ((Chef) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        addGestures()
    }
    
    private func setUI() {
        clipsToBounds = true
        layer.borderColor = UIColor.borderEFEFEF.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        lblState.clipsToBounds = true
        lblState.layer.cornerRadius = 10
        lblState.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        btnLike.adjustsImageWhenHighlighted = false
        btnShare.adjustsImageWhenHighlighted = false
        btnSave.adjustsImageWhenHighlighted = false
    }
    
    private func addGestures() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showAddressInGoogleMaps))
        lblAddress.addGestureRecognizer(tap)
    }
    
    func fill(with chef: Chef) {
        selectedChef = chef
        imgChefPhoto.image = UIImage(named: selectedChef.photo)
        lblChefName.text = selectedChef.name
        lblRating.text = selectedChef.rating
        lblAddress.text = selectedChef.address
        lblDistance.text = selectedChef.distance
        lblDescription.text = selectedChef.description
        imgPicture.image = UIImage(named: selectedChef.picture)
        isAvailabe = selectedChef.availability
        isMarked = selectedChef.isMarked
        isSaved = selectedChef.isSaved
    }
    
    func openAppleMaps() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2DMake(selectedChef.latitude, selectedChef.longitude), addressDictionary: nil))
        mapItem.name = selectedChef.address
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    private func openGoogleMaps() {
        guard let url = URL(string: "comgooglemaps://?daddr=\(selectedChef.latitude),\(selectedChef.longitude)&zoom=14&views=traffic") else { return }
        UIApplication.shared.open(url, options: [:])
    }
    
    private func openWaze() {
        let link = "https://www.waze.com/ul?ll=\(selectedChef.latitude)%2C\(selectedChef.longitude)&navigate=yes&zoom=17"
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url, options: [:])
    }
    
    @objc private func showAddressInGoogleMaps() {
        openAppleMaps()
    }
    
    @IBAction func markPresentation(_ sender: UIButton) {
        isMarked = !(sender.tag == 1)
    }
    
    @IBAction func sharePresentation(_ sender: UIButton) {
        shareInfo?(selectedChef)
    }
    
    @IBAction func savePresentation(_ sender: UIButton) {
        isSaved = !(sender.tag == 1)
    }
}
