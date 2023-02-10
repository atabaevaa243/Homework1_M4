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
    
    func display(item: Category) {
        categoryImageView.image = UIImage(named: item.categoryImage)
        categoryLabel.text = item.categoryLabel
    }
}
