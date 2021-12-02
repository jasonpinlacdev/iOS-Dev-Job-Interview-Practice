//
//  UITextField+AddDoneButton.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/31/21.
//

import UIKit

extension UITextField {

  func addDoneButton(target: Any?, selector: Selector?) {
    let toolbar = UIToolbar()
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: selector)
    toolbar.setItems([flexibleSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    self.inputAccessoryView = toolbar
  }
  
}


