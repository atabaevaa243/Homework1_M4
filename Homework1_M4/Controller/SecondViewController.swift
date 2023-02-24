//
//  SecondViewController.swift
//  Homework1_M4
//
//  Created by Aziza A on 24/2/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private weak var productImageView: UIImageView!
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        guard let product = product else {
            return
        }
        productImageView.image = UIImage(named: product.thumbnail)
    }
}
