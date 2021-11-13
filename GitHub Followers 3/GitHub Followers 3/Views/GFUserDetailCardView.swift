//
//  GFUserDetailCardView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/11/21.
//

@objc protocol GFUserDetailCardViewDelegate {
  @objc optional func didTapActionButton()
}





import UIKit

class GFUserDetailCardView: UIView {
  
  var delegate: GFUserDetailCardViewDelegate!
  
  private let horizontalStackView: UIStackView = {
    let horizontalStackView = UIStackView(frame: .zero)
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    horizontalStackView.axis = .horizontal
    return horizontalStackView
  }()
  
  
  private let verticalStackView: UIStackView = {
    let verticalStackView = UIStackView(frame: .zero)
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.axis = .vertical
    return verticalStackView
  }()



  init(leftDetailCardElementSymbol: UIImage, leftDetailCardElementTitle: String, leftDetailCardElementValue: Int, rightDetailCardElementSymbol: UIImage, rightDetailCardElementTitle: String, rightDetailCardElementValue: Int, actionButtonTitle: String, actionButtonColor: UIColor) {
    super.init(frame: .zero)
    
//    let leftDetailCardElementView: GFUserDetailCardViewElementView()
//    let rightDetailCardElementView: GFUserDetailCardViewElementView()
//    let actionButton = GFButton(title: <#T##String#>, color: <#T##UIColor#>)
//    actionButton.addTarget(self.delegate, action: #selector(self.delegate?.didTapActionButton), for: .touchUpInside)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.translatesAutoresizingMaskIntoConstraints = false

  }
  
  private func configureLayout() {
    
  }

}
