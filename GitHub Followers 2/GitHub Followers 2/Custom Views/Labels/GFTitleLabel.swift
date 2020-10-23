import UIKit

class GFTitleLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        configure(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(text: String) {
        self.text = text
        font = UIFont.preferredFont(forTextStyle: .title1)
        textAlignment = .center
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
    }
}
