//
//  GFUserInfoItemController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit

// The benefit of the child view controller vs the view is that you get access to all the life cycle methods. Can self contain the logic to drive the data and UI. Flexibility when presenting. Reusability.

class GFUserInfoItemController: UIViewController {
    
    let leftItemView: GFUserInfoItemView
    let rightItemView: GFUserInfoItemView
    let actionButton: GFButton!
    
    let horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 10.0
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStackView
    }()
    
    init(leftItemView: GFUserInfoItemView, rightItemView: GFUserInfoItemView, actionButtonTitle: String, actionButtonColor: UIColor) {
        self.leftItemView = leftItemView
        self.rightItemView = rightItemView
        actionButton = GFButton(title: actionButtonTitle, buttonColor: actionButtonColor)
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
    }
    
    private func configure() {
        actionButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layoutUI() {
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 16.0
        view.clipsToBounds = true
        
        horizontalStackView.addArrangedSubview(leftItemView)
        horizontalStackView.addArrangedSubview(rightItemView)
        
        view.addSubview(horizontalStackView)
        view.addSubview(actionButton)
        
        let padding: CGFloat = 20.0
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            horizontalStackView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -padding),
        
            actionButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        ])
    }

}
