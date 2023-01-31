
import UIKit

class SearchView: UIView {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var magnifierIconImageView: UIImageView!
    @IBOutlet private weak var searchLabel: UILabel!
    @IBOutlet private weak var settingsImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func display(item: String) {
        searchLabel.text = item
    }
    
    private func commonInit() {
        let fileName = String(describing: SearchView.self)
        Bundle.main.loadNibNamed(fileName, owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
