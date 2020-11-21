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
    
    init(leftItemView: GFUserInfoItemView, rightItemView: GFUserInfoItemView, actionButtonTitle: String, actionButtonColor: UIColor) {
        self.leftItemView = leftItemView
        self.rightItemView = rightItemView
        actionButton = GFButton(title: actionButtonTitle, buttonColor: actionButtonColor)
        super.init(nibName: nil, bundle: nil)
        actionButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 10.0
        horizontalStackView.addArrangedSubview(leftItemView)
        horizontalStackView.addArrangedSubview(rightItemView)
        return horizontalStackView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 10.0
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        verticalStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(actionButton)
        return verticalStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.layer.cornerRadius = 16.0
        view.clipsToBounds = true
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            actionButton.heightAnchor.constraint(equalTo: verticalStackView.heightAnchor, multiplier: 0.20),
        ])
    }

}