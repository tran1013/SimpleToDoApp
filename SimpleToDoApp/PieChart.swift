//
//  PieChart.swift
//  SimpleToDoApp
//
//  Created by Anh Duc Tran on 18.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit
import Charts

/**
 Extension for the StatisticsViewController to prepare the piechart
 */
extension StatisticsViewController
{
    
    
    /**
     This function prepares the piechart for the ui
     - Parameter dataPoints: Tags for done and undone on the x-axis
     - Parameter values: Values/Percentage to show them on the ui
     */
    func setChart(dataPoints: [String], values: [Double])
    {
        pieChartView.clear()
        if(values[0] == 0.0 && values[1] == 0.0)
        {
            freetimeLabel.text = String("Congratulations! Nothing to do!")
        } else {
            
            freetimeLabel.text = nil
            
            var dataEntries: [ChartDataEntry] = []
            var _dataPoints = dataPoints
            
            for i in 0..<dataPoints.count
            {
                let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
                if values[i] != 0 {
                    dataEntries.append(dataEntry) }
            }
            
            // Y-axis for dataentries
            let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "")
            
            // X-axis for mark done or undone
            if(values[0] == 100.0 && values[1] == 0.0)
            {
                _dataPoints.removeAtIndex(1)
            } else if(values[0] == 0.0 && values[1] == 100.0) {
                _dataPoints.removeAtIndex(0)
            }
            
            let pieChartData = PieChartData(xVals: _dataPoints, dataSet: pieChartDataSet)
            pieChartView.data = pieChartData
            
            var colors: [UIColor] = []
            
            for _ in 0..<dataPoints.count {
                let red = Double(arc4random_uniform(256))
                let green = Double(arc4random_uniform(256))
                let blue = Double(arc4random_uniform(256))
                let color = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
                colors.append(color)
            }
            
            pieChartDataSet.colors = colors
            pieChartDataSet.drawValuesEnabled = false
            
            pieChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .Linear)
            pieChartView.legend.enabled = false
            pieChartView.descriptionText = ""
        }
    }
    
}