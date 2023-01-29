//
//  ViewController.swift
//  Homework1_M4
//
//  Created by Aziza A on 29/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var deliveryCollectionView: UICollectionView!
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
    
    private let deliveryArray: [Delivery] = [
        Delivery(deliveryImage: "deliveryIcon", deliveryLabel: "Delivery"),
        Delivery(deliveryImage: "pickupIcon", deliveryLabel: "Pickup"),
        Delivery(deliveryImage: "cateringIcon", deliveryLabel: "Catering"),
        Delivery(deliveryImage: "curbsideIcon", deliveryLabel: "Curbside")
    ]
    
    private let categoryArray: [Category] = [
        Category(categoryImage: "takeaways", categoryLabel: "Takeaways"),
        Category(categoryImage: "grocery", categoryLabel: "Grocery"),
        Category(categoryImage: "convinience", categoryLabel: "Convinience"),
        Category(categoryImage: "pharmacy", categoryLabel: "Pharmacy")
    ]
    
    private let productArray: [Product] = [
        Product(
            productImage: "burgerImage",
            productName: "Burger Craze",
            openClose: "OPEN",
            productRatingFirst: "4.6",
            productRatingSecond: "601",
            productCountry: "American",
            productType: "Burgers",
            productDelivery: "Delivery: FREE",
            productDeliveryPrice: "Minimum: $10",
            deliveryTime: "15-20 min",
            productDestination: "1.5 km away"
        ),
        Product(
            productImage: "pizzaImage",
            productName: "Vegetarian Pizza",
            openClose: "OPEN",
            productRatingFirst: "4.6",
            productRatingSecond: "601",
            productCountry: "Italian",
            productType: "Pizza",
            productDelivery: "Delivery: FREE",
            productDeliveryPrice: "Minimum: $10",
            deliveryTime: "10-15 min",
            productDestination: "2.0 km away"
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDeliveryCV()
        configureCategoryCV()
        configureProductTV()
    }
    
    private func configureDeliveryCV() {
        deliveryCollectionView.dataSource = self
        deliveryCollectionView.delegate = self
        deliveryCollectionView.register(
            UINib(
                nibName: String(describing: DeliveryCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier: DeliveryCollectionViewCell.reuseIdentifier
        )
    }
    
    private func configureCategoryCV() {
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(
            UINib(
                nibName: String(describing: CategoryCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier
        )
    }
    
    private func configureProductTV() {
            productTableView.dataSource = self
            productTableView.register(
                UINib(
                    nibName: String(describing: ProductTableViewCell.self),
                    bundle: nil
                ),
                forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
        }
    }

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == deliveryCollectionView {
            return deliveryArray.count
        } else {
            return categoryArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == deliveryCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DeliveryCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! DeliveryCollectionViewCell
            let model = deliveryArray[indexPath.item]
            cell.display(image: model.deliveryImage, title: model.deliveryLabel)
            cell.layer.borderWidth = 0.8
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! CategoryCollectionViewCell
            let model = categoryArray[indexPath.item]
            cell.display(image: model.categoryImage, title: model.categoryLabel)
            
            return cell
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if collectionView == deliveryCollectionView {
            return CGSize(width: 110, height: 36)
        } else {
            return CGSize(width: 80, height: 105)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! ProductTableViewCell
        let model = productArray[indexPath.item]
        cell.display(
            image: model.productImage,
            name: model.productName,
            openClose: model.openClose,
            ratingFirst: model.productRatingFirst,
            ratingSecond: model.productRatingSecond,
            country: model.productCountry,
            type: model.productType,
            delivery: model.productDelivery,
            deliveryPrice: model.productDeliveryPrice,
            deliveryTime: model.deliveryTime,
            destination: model.productDestination
        )
        
        return cell
    }
    
    
}
