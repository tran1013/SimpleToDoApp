//
//  CommonData.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 17.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation

/**
 Singleton object to keep datas to use them between the controllers
 */
class CommonData {
    
    
    static let sharedInstance: CommonData = { CommonData() }()
    
    /**
     Variable to store the number of items which are done
     */
    var done: Double = 0
    
    /**
     Variable to store the number of items which are undone
     */
    var undone: Double = 0
}