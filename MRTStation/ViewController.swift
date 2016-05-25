//
//  ViewController.swift
//  MRTStation
//
//  Created by mac on 2016/5/5.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var MRTTableView: UITableView!
    
    var stationDataArray = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stationDataArray = StationData().getJson()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return stationDataArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stationDataArray[section].stationName.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return stationDataArray[section].lineName
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("MRTStationCell", forIndexPath: indexPath) as! MRTTableViewCell
        if stationDataArray[indexPath.section].stationNumber[indexPath.row].count == 1{
            
            let stationName = stationDataArray[indexPath.section].stationName[indexPath.row] as String
            let stationLineNumber = stationDataArray[indexPath.section].stationNumber[indexPath.row][0] as String
            let stationLineName = stationDataArray[indexPath.section].stationDetail[indexPath.row][0] as String
            cell.stationNameLabel.text = stationName
            cell.lineNumberLabel1.text = stationLineNumber
            cell.lineNumberLabel1.backgroundColor = StationData().getLineLabelColor(stationLineName)
            cell.lineLabel1.text = stationLineName
            cell.lineLabel1.hidden = true
            cell.lineLabel2.hidden = true
            cell.lineNumberLabel2.hidden = true
        
        }else{
            let stationName = stationDataArray[indexPath.section].stationName[indexPath.row] as String
            let stationLineNumber1 = stationDataArray[indexPath.section].stationNumber[indexPath.row][0] as String
            let stationLineNumber2 = stationDataArray[indexPath.section].stationNumber[indexPath.row][1] as String
            let stationLineName1 = stationDataArray[indexPath.section].stationDetail[indexPath.row][0] as String
            let stationLineName2 = stationDataArray[indexPath.section].stationDetail[indexPath.row][1] as String
            cell.stationNameLabel.text = stationName
            cell.lineNumberLabel1.text = stationLineNumber1
            cell.lineNumberLabel1.backgroundColor = StationData().getLineLabelColor(stationLineName1)
            cell.lineNumberLabel2.text = stationLineNumber2
            cell.lineNumberLabel2.backgroundColor = StationData().getLineLabelColor(stationLineName2)
            cell.lineLabel1.text = stationLineName1
            cell.lineLabel2.text = stationLineName2
            cell.lineLabel1.hidden = true
            cell.lineLabel2.hidden = true
            cell.lineNumberLabel2.hidden = false
        }
        
        
        
        // Configure the cell...
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if stationDataArray[indexPath.section].stationNumber[indexPath.row].count == 1{
        performSegueWithIdentifier("SingleLine", sender: self)
        
        }else {
            performSegueWithIdentifier("DualLine", sender: self)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let index = MRTTableView.indexPathForSelectedRow
        let detailCell = MRTTableView.cellForRowAtIndexPath(index!) as! MRTTableViewCell
       
        if segue.identifier == "SingleLine" {
            
            let destinationViewController = segue.destinationViewController as! SingleLineViewController
            
            destinationViewController.acceptName = detailCell.stationNameLabel.text!
            destinationViewController.acceptLineName = detailCell.lineLabel1.text!
        }else if segue.identifier == "DualLine" {
            
            let destinationViewController = segue.destinationViewController as! DualLineViewController
            
            destinationViewController.acceptName = detailCell.stationNameLabel.text!
            destinationViewController.acceptLineFirstName = detailCell.lineLabel1.text!
            destinationViewController.acceptLineSecondName = detailCell.lineLabel2.text!
            
        }
        
    }

    
}


