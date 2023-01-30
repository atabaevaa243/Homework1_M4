
import UIKit

class ProductsTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ProductsTableViewCell.self)
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productTimeLabel: UILabel!
    @IBOutlet private weak var productRetingLabel: UILabel!
    @IBOutlet private weak var productCountryLabel: UILabel!
    @IBOutlet private weak var productTypeLabel: UILabel!
    @IBOutlet private weak var productDeliveryLabel: UILabel!
    @IBOutlet private weak var productDeliveryPriceLabel: UILabel!
    @IBOutlet private weak var timeOfDeliveryLabel: UILabel!
    @IBOutlet private weak var productLocationLabel: UILabel!
    
    func display(
        image: String,
        name: String,
        time: String,
        reting: String,
        country: String,
        productType: String,
        delivery: String,
        deliveryPrice: String,
        timeOfDelivery: String,
        location: String
    ) {
        productImageView.image = UIImage(named: image)
        productNameLabel.text = name
        productTimeLabel.text = time
        productRetingLabel.text = reting
        productCountryLabel.text = country
        productTypeLabel.text = productType
        productDeliveryLabel.text = delivery
        productDeliveryPriceLabel.text = deliveryPrice
        timeOfDeliveryLabel.text = timeOfDelivery
        productLocationLabel.text = location
    }
}
