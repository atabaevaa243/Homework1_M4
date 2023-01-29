
import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ProductTableViewCell.self)
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var openCloseLabel: UILabel!
    @IBOutlet private weak var productRatingFirstLabel: UILabel!
    @IBOutlet private weak var productRatingSecondLabel: UILabel!
    @IBOutlet private weak var productCountryLabel: UILabel!
    @IBOutlet private weak var productTypeLabel: UILabel!
    @IBOutlet private weak var productDeliveryLabel: UILabel!
    @IBOutlet private weak var productDeliveryPriceLabel: UILabel!
    @IBOutlet private weak var deliveryTimeLabel: UILabel!
    @IBOutlet private weak var productDestinationLabel: UILabel!
    
    func display(
        image: String,
        name: String,
        openClose: String,
        ratingFirst: String,
        ratingSecond: String,
        country: String,
        type: String,
        delivery: String,
        deliveryPrice: String,
        deliveryTime: String,
        destination: String
    ) {
        productImageView.image = UIImage(named: image)
        productNameLabel.text = name
        openCloseLabel.text = openClose
        productRatingFirstLabel.text = ratingFirst
        productRatingSecondLabel.text = ratingSecond
        productCountryLabel.text = country
        productTypeLabel.text = type
        productDeliveryLabel.text = delivery
        productDeliveryPriceLabel.text = deliveryPrice
        deliveryTimeLabel.text = deliveryTime
        productDestinationLabel.text = destination
    }
}
