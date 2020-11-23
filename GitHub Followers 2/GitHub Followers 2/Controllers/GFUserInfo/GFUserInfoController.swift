//
//  GFUserInfoController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit

class GFUserInfoController: UIViewController {
    
    let user: GFUser
    
    let headerContainerView = UIView()
    
    init(user: GFUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var headerViewController = GFUserInfoHeaderController(user: self.user)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTappedToDismissController))
    }
    
    private func layoutUI() {
        view.addSubview(headerContainerView)
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        add(childViewController: headerViewController, to: headerContainerView)
        
        let padding: CGFloat = 10.0
        NSLayoutConstraint.activate([
            headerContainerView.heightAnchor.constraint(equalToConstant: 200),
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        self.addChild(childViewController)
        childViewController.view.frame = containerView.bounds
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    @objc func doneTappedToDismissController() {
        self.dismiss(animated: true)
    }
    

}

