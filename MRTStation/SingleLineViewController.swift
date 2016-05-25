//
//  SingleLineViewController.swift
//  MRTStation
//
//  Created by mac on 2016/5/23.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

class SingleLineViewController: UIViewController {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    
    var acceptName: String!
    var acceptLineName: String!
    
    func getLineLabelColor(lineName: String) -> UIColor {
        
        if lineName.containsString("文湖") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if lineName.containsString("板南") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if lineName.containsString("松山新店") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if lineName.containsString("淡水信義") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if lineName.containsString("貓空") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if lineName.containsString("中和新蘆") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if lineName.containsString("新北投") {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        } else {
            return UIColor(red: 205/255, green: 220/255, blue: 0/255, alpha: 1)
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = acceptName
        
        self.stationNameLabel.text = acceptName
        self.lineLabel.text = acceptLineName
    self.lineLabel.backgroundColor = getLineLabelColor(acceptLineName)
        
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
