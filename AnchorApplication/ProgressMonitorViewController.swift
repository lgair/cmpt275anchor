//
//  ProgressMonitorViewController.swift
//  AnchorApplication
//
//  Created by CMPT275 on 2018-11-26.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Charts

// to format date
public class DateValueFormatter: NSObject, IAxisValueFormatter {
    private let dateFormatter = DateFormatter()

    override init() {
        super.init()
        dateFormatter.dateFormat = "MM-dd HH:mm"
    }

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}

class ProgressMonitorViewController: UIViewController {
    
    // link line chart view
    @IBOutlet weak var chartView: LineChartView!
    
    @IBOutlet weak var startDate: UIButton!
    
    @IBOutlet weak var endDate: UIButton!
    
    @IBOutlet weak var generateButton: UIButton!
    
    // configure UIDatePicker
    
    // declare reference variable for firebase realtime database
    var ref: DatabaseReference!
    
    // arrays to build chart with
    var dateArr: [Date] = []
    var dosageArr: [Int] = []
    var typeArr: [Int] = []
    
    // default number of keys to query
    var queryLimit: Int = 7
    
    var count: Int = 20
    
    var startIndex: Int = 0
    var endIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("progress monitor loaded")
        
        // create instance for database
        ref = Database.database().reference()
        
        // configure the x-axis of chart
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.centerAxisLabelsEnabled = true
        xAxis.valueFormatter = DateValueFormatter()
        
        // configure the y-axis of chart
        let leftAxis = chartView.leftAxis
        leftAxis.labelPosition = .outsideChart
        leftAxis.drawGridLinesEnabled = true
        // query the database for dataset to create the chart with
        queryDB()
    }
    
    func queryDB() {
        // query database for the recent 7 data
        ref.child("progress").queryLimited(toLast: UInt(queryLimit)).observeSingleEvent(of: .value, with: { (snapshot) in
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                // set the key as date
                let dateString = snap.key
                let formatter = DateFormatter()
                // make sure the format is just yyyy-MM-dd in actual version
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                var date = formatter.date(from: dateString)
                // since value is of type Any use firebaseResponse to get specific values
                guard let firebaseResponse = snap.value as? [String:Any] else
                {
                    print("Snapshot is nil hence no data returned")
                    return
                }
                // find values of dosage and type from the current key
                let dosage = firebaseResponse["dosage"] as! Int
                let type = firebaseResponse["type"] as! Int
                
                // add the key (dates) into array
                self.dateArr.append(date!)
                self.dosageArr.append(dosage)
                self.typeArr.append(type)
            }// end of for loop for keys
            
            // firebase query is asynchronous so functions using the new values must be called here
            //self.printArr()
            self.count = self.dosageArr.count
            self.endIndex = self.dosageArr.count
            self.setChartValues()
        })// end of query for snapshot
        
    }// end of func createChart
    
    func printArr() {
        print("printing arrays")
        dump(self.dateArr)
        dump(self.dosageArr)
        dump(self.typeArr)
    }
    
    // making the chart
    func setChartValues() {
        // array for color depending on type of drug
        var colorArr = [UIColor]()
        var dataSets = [ChartDataEntry]()
        var allLineChartDataSets: [LineChartDataSet] = [LineChartDataSet]()
        // default is create as many points as there are indexes in the array
        let values = (startIndex..<endIndex).map { (i) -> ChartDataEntry in
            
            let val = Double(self.dosageArr[i])
            let timeRange = dateArr[i].timeIntervalSince1970
            let xval = Double(timeRange)
            
            // immediate release type will be blue
            if self.typeArr[i] == 1 {
                colorArr.append(UIColor.blue)
            }
            // time released type will be green
            else if self.typeArr[i] == 2 {
                colorArr.append(UIColor.green)
                
            }
            // populate the values with dosage
            //return ChartDataEntry(x: xval, y: val)
            let dataEntry1 = ChartDataEntry(x: xval, y: val)
            dataSets.append(dataEntry1)
            return dataEntry1
        }
        
        let set1 = LineChartDataSet(values: dataSets, label: "immediate release(mg)")
        allLineChartDataSets.append(set1)
        
        var dataSets2 = [ChartDataEntry]()
        let values2 = (startIndex..<endIndex).map { (i) -> ChartDataEntry in
            
            let val2 = Double(self.dosageArr[i])
            let timeRange = dateArr[i].timeIntervalSince1970
            let xval2 = Double(timeRange)
            
            // immediate release type will be blue
            if self.typeArr[i] == 1 {
                colorArr.append(UIColor.blue)
            }
                // time released type will be green
            else if self.typeArr[i] == 2 {
                colorArr.append(UIColor.green)
                
            }
            // populate the values with dosage
            //return ChartDataEntry(x: xval, y: val)
            let dataEntry2 = ChartDataEntry(x: xval2, y: val2)
            dataSets2.append(dataEntry2)
            return dataEntry2
        }
        
        let set2 = LineChartDataSet(values: dataSets2, label: "controlled release(mg)")
        allLineChartDataSets.append(set2)
        

        // generate graph
        let data = LineChartData(dataSets: allLineChartDataSets)
        // color the dots according to the types
        set1.circleColors = colorArr
        set2.circleColors = colorArr
        // configure the graphics for the line graph
        set1.circleRadius = 5
        set1.circleHoleRadius = 0
        set1.lineWidth = 2
        // give the illusion of second graph not existing
        set2.lineWidth = 0
        set2.circleRadius = 0
        //set colors of each line graph to match the legend
        set1.setColor(.blue)
        set2.setColor(.green)
        
        // do not show values for second graph
        set2.drawValuesEnabled = false
        
        chartView.rightAxis.enabled = false
        self.chartView.data = data
        self.chartView.xAxis.labelRotationAngle = -12.0
        self.chartView.drawGridBackgroundEnabled = true
        self.chartView.gridBackgroundColor = UIColor(red:0.86, green:0.83, blue:0.83, alpha:1.0)
        chartView.chartDescription?.text = "dosage progress"
    }
    
    
    @IBAction func saveGraph(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(chartView.getChartImage(transparent: false)!, nil, nil, nil)
    }
    
    // allow user to choose a range of data to graph
    @IBAction func selectStartDate(_ sender: UIButton) {
        // set the style of alert controller as action sheet
        let alert = UIAlertController(title: "Start Date", message: "Choose starting date", preferredStyle: .actionSheet)
        
        // add contents of dateArr and have an indicator of the index chosen
        for i in (0..<(count-1)) {
            // format the variable from date to string
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            var dateString = dateFormatter.string(from:dateArr[i])
            let action = UIAlertAction(title: dateString, style: .default) { (action:UIAlertAction) in
                // set the starting index for custom view
                self.startIndex = i
                self.startDate.setTitle(dateString, for: .normal)
                print("the date \(dateString) and index \(i)");
            }
            // add the button into the action sheet
            alert.addAction(action)
        }
        
        // make a cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    // allow user to choose a range of data to graph
    @IBAction func selectEndDate(_ sender: Any) {
        // set the style of alert controller as action sheet
        let alert = UIAlertController(title: "End Date", message: "Choose starting date", preferredStyle: .actionSheet)
        
        // add contents of dateArr starting from previously set index
        for i in ((startIndex+1)..<count) {
            // format the variable from date to string
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            var dateString = dateFormatter.string(from:dateArr[i])
            let action = UIAlertAction(title: dateString, style: .default) { (action:UIAlertAction) in
                // set the starting index for custom view
                self.endIndex = i+1
                self.endDate.setTitle(dateString, for: .normal)
                print("the date \(dateString) and index \(i)");
            }
            // add the button into the action sheet
            alert.addAction(action)
        }
        
        // make a cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)

    }
    
    // generate graph with selected time range
    @IBAction func generateNewGraph(_ sender: UIButton) {
        setChartValues()
    }
}
