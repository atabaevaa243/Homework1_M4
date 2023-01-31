
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
    
    
    public func display(item: Product) {
        productImageView.image = UIImage(named: item.productImage)
        productNameLabel.text = item.productName
        productTimeLabel.text = item.productTime
        productRetingLabel.text = item.productReting
        productCountryLabel.text = item.productCountry
        productTypeLabel.text = item.productType
        productDeliveryLabel.text = item.productDelivery
        productDeliveryPriceLabel.text = item.productDeliveryPrice
        timeOfDeliveryLabel.text = item.timeOfDelivery
        productLocationLabel.text = item.productLocation
    }
}
