
import UIKit

protocol ProductsCellDelegate: AnyObject {
    func didSelectProduct(item: Product)
}

class ProductsTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ProductsTableViewCell.self)
    
    @IBOutlet private weak var productImageView: UIImageView! {
        didSet {
            productImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnImage))
            productImageView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productTimeLabel: UILabel!
    @IBOutlet private weak var productRetingLabel: UILabel!
    @IBOutlet private weak var productCountryLabel: UILabel!
    @IBOutlet private weak var productTypeLabel: UILabel!
    @IBOutlet private weak var productDeliveryLabel: UILabel!
    @IBOutlet private weak var productDeliveryPriceLabel: UILabel!
    @IBOutlet private weak var timeOfDeliveryLabel: UILabel!
    @IBOutlet private weak var productLocationLabel: UILabel!
    
    weak var delegate: ProductsCellDelegate?
    private var product: Product?
    
    public func display(item: Product) {
        product = item
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
    
    @objc
    private func didTapOnImage() {
        print("image tapped")
        guard let product = product else {
            return
        }
        delegate?.didSelectProduct(item: product)
    }
}
