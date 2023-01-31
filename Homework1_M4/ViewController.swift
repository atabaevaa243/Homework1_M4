//
//  ViewController.swift
//  Homework1_M4
//
//  Created by Aziza A on 29/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var deliveryCollectionView: UICollectionView!
    @IBOutlet private weak var searchView: SearchView!
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
    
    var productsArray: [Product] = [
            Product(
                productImage: "burgerImage",
                productName: "Burger Craze",
                productTime: "Open",
                productReting: "4.6 (601)",
                productCountry: "American",
                productType: "Burgers",
                productDelivery: "Delivery: FREE",
                productDeliveryPrice: "Minimum: $10",
                timeOfDelivery: "15-20 min",
                productLocation: "1.5 km away"
            ),
            Product(
                productImage: "pizzaImage",
                productName: "Vegetarian Pizza",
                productTime: "Open",
                productReting: "4.6 (601)",
                productCountry: "Italian",
                productType: "Pizza",
                productDelivery: "Delivery: FREE",
                productDeliveryPrice: "Minimum: $10",
                timeOfDelivery: "10-15 min",
                productLocation: "1.8 km away"
            ),
            Product(
                productImage: "burgerImage",
                productName: "Burger Craze",
                productTime: "Open",
                productReting: "4.6 (601)",
                productCountry: "American",
                productType: "Burgers",
                productDelivery: "Delivery: FREE",
                productDeliveryPrice: "Minimum: $10",
                timeOfDelivery: "15-20 min",
                productLocation: "1.5 km away"
            )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.display(item: "Find store by name")
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
                    nibName: String(describing: ProductsTableViewCell.self),
                    bundle: nil
                ),
                forCellReuseIdentifier: ProductsTableViewCell.reuseIdentifier)
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
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductsTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! ProductsTableViewCell
        let model = productsArray[indexPath.item]
        cell.display(
            image: model.productImage,
            name: model.productName,
            time: model.productTime,
            reting: model.productReting,
            country: model.productCountry,
            productType: model.productType,
            delivery: model.productDelivery,
            deliveryPrice: model.productDeliveryPrice,
            timeOfDelivery: model.timeOfDelivery,
            location: model.productLocation)
        
        return cell
    }
}
