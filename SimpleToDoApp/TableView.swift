//
//  TableView.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 18.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

/**
 Extension for the ToDoListViewController to fill the tableview with datas and keeps all methods to interact with the table view
 */
extension ToDoViewController
{
    
    /**
     How many sections needs to be displayed. Each group of contacts forms a section
     In this case we just need one section
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /**
     How many rows each section contains
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    /**
     Prepares each cell in the tableview
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CustomTableCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomTableCell
        
        /**
         Need to know what to use from mockToDos array
         indexPath contains the row or index ot the table view cell
         fetch the correct todo by asking mockToDos array for item at indexPath.row
         */
        let mockToDos = toDoArray[indexPath.row].toDoItem
        
        cell.textLabel?.text = mockToDos
        
        cell.tickBtn.addTarget(self, action: #selector(tickClicked(_:)), forControlEvents: .TouchUpInside)
        
        cell.tickBtn.tag = indexPath.row
        
        if toDoArray[indexPath.row].isDone == true {
            cell.tickBtn.setBackgroundImage(UIImage(named: "checked"), forState: UIControlState.Normal)
        }
        if toDoArray[indexPath.row].isDone == false
        {
            cell.tickBtn.setBackgroundImage(UIImage(named: "unchecked"), forState: UIControlState.Normal)
        }
        
        return cell
    }
    
    /**
     Asks the datasource to verify that the given row is editable.
     */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    /**
     This function is for removing an item from the tableview and the toDoArray
     */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            toDoArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            getCommonDatas()
            tableView.reloadData()
        }
        
    }
    
    /**
     This function checks the status of the items. Click on an item on the UI sets the status of an item to false or true. After setting the status, the tableview will be reloaded.
     */
    func tickClicked(sender: UIButton!) {
        let value = sender.tag
        
        if (toDoArray[value].isDone == false)
        {
            toDoArray[value].isDone = true
        } else
        {
            toDoArray[value].isDone = false
        }
        tableView.reloadData()
        print("Array:")
        for element in toDoArray {
            print("Item: \(element.toDoItem) - isDone: \(element.isDone)")
        }
        print("=============================================")
        getCommonDatas()
    }
    
    /**
     This function gets a string from the ui and add it to the tableview and the toDoArray array
     - Parameter textFieldInput: text from the ui
     - Returns: void
     */
    func addItem(textFieldInput: String)
    {
        toDoArray.append(ToDoItem(toDoItem: textField.text!))
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: toDoArray.count - 1, inSection: 0)], withRowAnimation: .Fade)
        tableView.endUpdates()
        getCommonDatas()
    }
    
    /**
     This function counts the dones and undones in the toDoArray and calculate the percentage to push them to the ui
     */
    func getCommonDatas() {
        if (toDoArray.count > 0) {
            let _done = (Double(toDoArray.filter({ $0.isDone == true }).count) / Double(toDoArray.count)) * 100
            let _undone = (Double(toDoArray.filter({ $0.isDone == false }).count) / Double(toDoArray.count)) * 100
            commonData.done = _done
            commonData.undone = _undone
        } else {
            commonData.done = 0
            commonData.undone = 0
        }
    }
}