//
//  CategoryCollectionViewCell.swift
//  Homework1_M4
//
//  Created by Aziza A on 30/1/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    func display(
        image: String,
        title: String
    ) {
        categoryImageView.image = UIImage(named: image)
        categoryLabel.text = title
    }
}
