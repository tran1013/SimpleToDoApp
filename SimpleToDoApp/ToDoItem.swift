//
//  ToDoItem.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 18.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation

/**
 This class defines the item object.
 An object has an item as string and a boolean to check is whether the item done or undone
 */
class ToDoItem
{
    /**
     Variable to store item as a string
     */
    var toDoItem: String
    
    /**
     Variable to store the status of an item as a boolean
     */
    var isDone: Bool
    
    /**
     Initialize object
     */
    init(toDoItem: String)
    {
        self.toDoItem = toDoItem
        self.isDone = false
    }
    
}