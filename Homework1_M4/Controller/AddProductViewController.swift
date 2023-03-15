//
//  AddProductViewController.swift
//  Homework1_M4
//
//  Created by Aziza A on 21/2/23.
//

import UIKit

class AddProductViewController: UIViewController {
    
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var priceTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    @IBOutlet weak var categoryTextfield: UITextField!
    @IBOutlet weak var brandTextfield: UITextField!
    
    @IBAction private func addProductTapped() {
        guard
            let title = titleTextfield.text, title.isNotEmpty,
            let price = priceTextfield.text, price.isNotEmpty,
            let description = descriptionTextfield.text, description.isNotEmpty,
            let category = categoryTextfield.text, category.isNotEmpty,
            let brand = brandTextfield.text, brand.isNotEmpty else {
            return
        }
        
        let product = Product(
            id: 0,
            thumbnail: "",
            title: title,
            discountPercentage: 0,
            rating: 0,
            brand: brand,
            description: description,
            category: category,
            stock: 0,
            price: Int(price) ?? 0)
        
        addNew(product)
    }

    private func addNew(_ product: Product) {
        Task {
            do {
                try await NetworkLayer.shared.addNewProduct(with: product)
                DispatchQueue.main.async {
                    self.showAlert(with: "Продукт успешно добавлен!")
                    self.clearAllTextfields()
                }
            } catch {
                self.showAlert(with: "Данные введены неверно")
            }
        }
    }
    
    private func clearAllTextfields() {
        titleTextfield.text?.removeAll()
        priceTextfield.text?.removeAll()
        descriptionTextfield.text?.removeAll()
        categoryTextfield.text?.removeAll()
        brandTextfield.text?.removeAll()
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(
            title: "Добавление",
            message: message,
            preferredStyle: .alert
        )
        let acceptAction = UIAlertAction(
            title: "OK",
            style: .cancel
        )
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
}

extension String {
    var isNotEmpty: Bool {
        !isEmpty
    }
}
