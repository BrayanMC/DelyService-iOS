//
//  HomeViewController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, InstantiableController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var cvChefsList: UICollectionView!
    
    var selectedChef: Chef!
    
    private var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
        
        homeViewModel.loadChefs()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        addBorderGradientColor()
    }
    
    private func setUI() {
        cvChefsList.register(ChefPresentationViewCell.self)
        cvChefsList.dataSource = self
        cvChefsList.delegate = self
    }
    
    private func bind() {
        homeViewModel.showChefs.delegate(to: self) { (self, chefs) in
            debugPrint("Chefs: \(chefs)")
            self.cvChefsList.reloadData()
        }
        
        homeViewModel.showChefProducts = { chef -> Void in
            debugPrint("Dirección: \(chef.address)")
            self.selectedChef = chef
            if (chef.availability) {
                self.initChefProductsView()
            }
        }
    }
    
    private func addBorderGradientColor() {
        imgProfile.addCircleGradiendBorder(borderWidth: 2, colors: [UIColor.init(hexString: .HEX51EFF5).cgColor, UIColor.init(hexString: .HEX6AD20F).cgColor])
    }
    
    private func initChefProductsView() {
        let chefProductsVC = ChefProductsViewController.instance()
        chefProductsVC.chef = selectedChef
        self.navigationController?.pushViewController(chefProductsVC, animated: true)
    }
    
    static func instance() -> HomeViewController {
        return StoryBoardManager.default.initViewController(from: .home, with: .homeViewController) as! HomeViewController
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.chefs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let chefItem = collectionView.dequeueCell(forIndexPath: indexPath) as ChefPresentationViewCell
        chefItem.fill(with: homeViewModel.chefs[indexPath.row])
        chefItem.shareInfo = { chef -> Void in
            let mActivityViewController = UIActivityViewController(activityItems: [chef.address, chef.distance], applicationActivities: nil)
            self.present(mActivityViewController, animated: true, completion: nil)
        }
        return chefItem
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewModel.showChefProducts!(homeViewModel.chefs[indexPath.row])
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 20.0, height: 245)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
}
