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
    
    private var deliveryArray: [Delivery] = []
    private var categoryArray: [Category] = []
    private var productsArray: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.display(item: "Find store by name")
        configureDeliveryCV()
        configureCategoryCV()
        configureProductTV()
        fetchDelivery()
        fetchCategory()
        fetchProduct()
    }
    
    private func showAlert(_ error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: "\(error.localizedDescription)",
            preferredStyle: .alert
        )
        let acceptAction = UIAlertAction(
            title: "OK",
            style: .destructive
        )
        alert.addAction(acceptAction)
        present(alert, animated: true)
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
    
    private func fetchDelivery() {
        do {
            deliveryArray = try NetworkLayer.shared.fetchDelivery()
            deliveryCollectionView.reloadData()
        } catch {
            showAlert(error)
        }
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
    
    private func fetchCategory() {
        do {
            categoryArray = try NetworkLayer.shared.fetchCategory()
            categoryCollectionView.reloadData()
        } catch {
            showAlert(error)
        }
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
    private func fetchProduct() {
        do {
            productsArray = try NetworkLayer.shared.fetchProduct()
            productTableView.reloadData()
        } catch {
            showAlert(error)
        }
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
            cell.display(item: model)
            cell.layer.borderWidth = 0.8
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! CategoryCollectionViewCell
            let model = categoryArray[indexPath.item]
            cell.display(item: model)
            
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
        cell.display(item: model)
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: ProductsCellDelegate {
    func didSelectProduct(item: Product) {
        let secondVC = storyboard?.instantiateViewController(
            withIdentifier: "SecondViewController"
        ) as! SecondViewController
        secondVC.product = item
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
