//
//  ToDoViewController.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 17.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     Outlet for a textfield which will be filled with text from the ui
     */
    @IBOutlet var textField: UITextField!
    
    /**
     Outlet for an add button to trigger a new item
     */
    @IBOutlet var addBtn: UIButton!
    
    /**
     Outlet for a TableView to display the table view on the ui
     */
    @IBOutlet var tableView: UITableView!
    
    /**
     Variable to identify cells in the tableview.
     */
    let cellIdentifier = "CellIdentifier"
    
    /**
     Constant to hold the percentage of done and undone items between the controllers
     - Note: Singleton Pattern was used here. That means, there is always just one instance available to get these datas
     */
    let commonData = CommonData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        getCommonDatas()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addItemToList(sender: AnyObject) {
        self.dismissKeyboard()
        if (textField.text!.isEmpty) {
            let alertController = UIAlertController(title: "Why no input?!", message: "Type something in...", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            print(textField.text! + " fkewfewp")
            addItem(textField.text!)
            textField.text = ""
        }
    }
    
}



