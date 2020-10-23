//
//  GFAlertController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

class GFAlertController: UIViewController {
    
    let alertTitle: String
    let alertMessage: String
    let alertButtonTitle: String
    
    let alertContainterView = GFAlertContainer()
    lazy var alertTitleLabel = GFTitleLabel(text: alertTitle)
    lazy var alertMessageLabel = GFBodyLabel(text: alertMessage)
    lazy var alertButton = GFButton(title: alertButtonTitle, buttonColor: .systemPink)
    lazy var verticalStackView = GFAlertVerticalStackView(arrangedSubviews: [alertTitleLabel, alertMessageLabel, alertButton])
     
    init(alertTitle: String, alertMessage: String, alertButtonTitle: String) {
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.alertButtonTitle = alertButtonTitle
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
    
    @objc func dismissAlert() {
        dismiss(animated: true)
    }
    
    // MARK: - Configuration and Layout -
    
    private func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        alertButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }

    private func layoutUI() {
        view.addSubview(alertContainterView)
        alertContainterView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            alertContainterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertContainterView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertContainterView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33),
            alertContainterView.heightAnchor.constraint(equalTo: alertContainterView.widthAnchor),
        
            verticalStackView.topAnchor.constraint(equalTo: alertContainterView.topAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: alertContainterView.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: alertContainterView.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: alertContainterView.bottomAnchor, constant: -20),
            
            alertButton.heightAnchor.constraint(equalTo: verticalStackView.heightAnchor, multiplier: 0.20),
        ])
    }
    
}
