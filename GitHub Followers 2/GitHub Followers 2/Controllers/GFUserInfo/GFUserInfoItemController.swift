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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
    }
    
    private func layoutUI() {
        
    }

}
