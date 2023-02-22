//
//  MainViewController.swift
//  Homework1_M4
//
//  Created by Aziza A on 29/1/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var deliveryCollectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
    
    private var deliveryArray: [Delivery] = []
    private var categoryArray: [Category] = []
    private var productsArray: [Product] = []
    private var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDeliveryCV()
        configureCategoryCV()
        configureProductTV()
        fetchDelivery()
        fetchCategory()
        fetchProduct()
    }
    
    private func showError(_ error: Error) {
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
            forCellReuseIdentifier: ProductTableViewCell.reuseId
        )
    }
    
    private func fetchDelivery() {
        do {
            deliveryArray = try NetworkLayer.shared.fetchDelivery()
            deliveryCollectionView.reloadData()
        } catch {
            showError(error)
        }
    }
    
    private func fetchCategory() {
        do {
            categoryArray = try NetworkLayer.shared.fetchCategory()
            categoryCollectionView.reloadData()
        } catch {
            showError(error)
        }
    }
    
    private func fetchProduct() {
        isLoading = true
        NetworkLayer.shared.fetchProduct { result in
            self.isLoading = false
            switch result {
            case .success(let model):
                self.productsArray = model
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .failure(let error):
                self.showError(error)
            }
        }
    }
    
    private func searchProduct(by word: String) {
        isLoading = true
        NetworkLayer.shared.searchProduct(by: word) { result in
            self.isLoading = false
            switch result {
            case .success(let model):
                self.productsArray = model
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .failure(let error):
                self.showError(error)
            }
        }
    }
    
    private func deleteProduct() {
        isLoading = true
        NetworkLayer.shared.deleteProduct { result in
            self.isLoading = false
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    let indexPath = IndexPath(row: 0, section: 0)
                    self.productsArray.remove(at: indexPath.row)
                    self.productTableView.deleteRows(at: [indexPath], with: .automatic)
                    self.productTableView.reloadData()
                }
            case .failure(let error):
                self.showError(error)
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
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

extension MainViewController: UICollectionViewDelegateFlowLayout {
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.reuseId,
            for: indexPath
        ) as! ProductTableViewCell
        let model = productsArray[indexPath.item]
        cell.display(item: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete product")
            self.deleteProduct()
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !isLoading {
            searchProduct(by: searchText)
        }
    }
}

//    func tableView(
//        _ tableView: UITableView,
//        editActionsForRowAt indexPath: IndexPath
//    ) -> UITableViewRowAction? {
//        let deleteAction = UITableViewRowAction(style: .destructive, title: "Удалить") { (_, indexPath) in
//            self.productsArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.reloadData()
//        }
//        return deleteAction
//    }

//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "") { _, _, completionHandler in
//            self.productsArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            completionHandler(true)
//        }
//        deleteAction.image = UIImage(systemName: "trash")
//        deleteAction.backgroundColor = .systemRed
//        let config = UISwipeActionsConfiguration(actions: [deleteAction])
//        config.performsFirstActionWithFullSwipe = false
//        return config
//    }
