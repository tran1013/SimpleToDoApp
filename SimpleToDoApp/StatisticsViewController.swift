//
//  StatisticsViewController.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 17.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import UIKit
import Charts

class StatisticsViewController: UIViewController {
    
    /**
     Outlet for a PieChartView to display the piechart
     */
    @IBOutlet var pieChartView: PieChartView!
    
    /**
     Outlet for a doneLabel which always shows the actually percentage of done in the ui
     */
    @IBOutlet var doneLabel: UILabel!
    
    /**
     Outlet for a undoneLabel which always shows the actually percentage of undone in the ui
     */
    @IBOutlet var undoneLabel: UILabel!
    
    /**
     Outlet appears if there are no todos
     */
    @IBOutlet var freetimeLabel: UILabel!
    
    /**
     Constant to hold the percentage of done and undone items between the controllers
     - Note: Singleton Pattern was used here. That means, there is always just one instance available to get these datas
     */
    let commonData = CommonData.sharedInstance
    
    /**
     Mark the x-axis of the piechartview with done and undone
     */
    let pieChartAxis = ["Done", "Undone"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let done = commonData.done
        let undone = commonData.undone
        let percentageAxis = [done, undone]
        setChart(pieChartAxis, values: percentageAxis)
        setLabels()
        pieChartView.noDataText = String("")
        print("Actuall percentage: " + String(percentageAxis))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        setLabels()
        viewDidLoad()
    }
    
    /**
     Update the percentage labels for done and undone items
     */
    func setLabels()
    {
        doneLabel.text = String(format: "%.1f", commonData.done) + "%"
        undoneLabel.text = String(format: "%.1f", commonData.undone) + "%"
    }
    
    
}

