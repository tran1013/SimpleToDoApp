//
//  HideKeyboard.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 18.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

/**
 Extension to hide the keyboard from screen
 */
extension UIViewController
{
    /**
     Hide the keyboard if recognize tap gesture on the screen
     */
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    /**
     Main function to hide the keyboard if its displayed on the screen
     */
    func dismissKeyboard() {
        view.endEditing(true)
    }
}