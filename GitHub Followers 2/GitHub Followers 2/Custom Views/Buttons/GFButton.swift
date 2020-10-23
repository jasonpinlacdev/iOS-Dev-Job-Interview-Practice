import UIKit

final class GFButton: UIButton {
    
    let title: String
    let buttonColor: UIColor
    
    override var isHighlighted: Bool {
        didSet {
            self.titleLabel?.alpha = (isHighlighted && self.titleLabel != nil) ? 0.25 : 1.0
        }
    }
    
    init(title: String, buttonColor: UIColor) {
        self.title = title
        self.buttonColor = buttonColor
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10.0
        backgroundColor = buttonColor
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
