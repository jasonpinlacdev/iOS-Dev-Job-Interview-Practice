//
//  UITextField+Ext.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

extension UITextField {
  func addDoneButton(target: Any?, selector: Selector?) {
    let flexibleSpaceItem = UIBarButtonItem(systemItem: .flexibleSpace)
    let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: selector)
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    toolbar.setItems([flexibleSpaceItem, doneButtonItem], animated: false)
    self.inputAccessoryView = toolbar
  }
}


