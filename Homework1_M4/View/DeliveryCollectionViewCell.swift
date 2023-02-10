//
//  DeliveryCollectionViewCell.swift
//  Homework1_M4
//
//  Created by Aziza A on 29/1/23.
//

import UIKit

class DeliveryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: DeliveryCollectionViewCell.self)
    
    @IBOutlet private weak var deliveryImageView: UIImageView!
    @IBOutlet private weak var deliveryLabel: UILabel!
        
    func display(item: Delivery) {
        deliveryImageView.image = UIImage(named: item.deliveryImage)
        deliveryLabel.text = item.deliveryLabel
    }
}
