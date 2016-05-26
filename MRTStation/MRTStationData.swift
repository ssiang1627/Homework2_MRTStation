//
//  MRTStationData.swift
//  MRTStation
//
//  Created by mac on 2016/5/23.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Station {
    var lineName: String
    var stationName: [String]
    var stationNumber: [[String]]
    var stationDetail: [[String]]
    init(lineName: String ,stationName: [String] ,stationNumber: [[String]] ,stationDetail: [[String]]){
        self.lineName = lineName
        self.stationName = stationName
        self.stationNumber = stationNumber
        self.stationDetail = stationDetail
    }
}
class StationData {
    
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

    func getJson() -> [Station] {
        
        let path = NSBundle.mainBundle().pathForResource("MRT", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data!)
        
        var wenhu = [String]()
        var shinru = [String]()
        var shinyi = [String]()
        var xindian = [String]()
        var beito = [String]()
        var bennan = [String]()
        var bitan = [String]()
        var moukun = [String]()
        
        var wenhuNumber = [[String]]()
        var shinruNumber = [[String]]()
        var shinyiNumber = [[String]]()
        var xindianNumber = [[String]]()
        var beitoNumber = [[String]]()
        var bennanNumber = [[String]]()
        var bitanNumber = [[String]]()
        var moukunNumber = [[String]]()
        
        var wenhuLineName = [[String]]()
        var shinruLineName = [[String]]()
        var shinyiLineName = [[String]]()
        var xindianLineName = [[String]]()
        var beitoLineName = [[String]]()
        var bennanLineName = [[String]]()
        var bitanLineName = [[String]]()
        var moukunLineName = [[String]]()
        
        for i in 0...json.count{
            let stationName = json[i]["name"].stringValue
            //let coordinate = json[i]["coordinate"].stringValue
            let lineName = json[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.0
            })
            let lineNumber = json[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.1.stringValue
            })
            
            if lineName.contains("文湖線") {
                wenhu.append(stationName)
                wenhuNumber.append(lineNumber)
                wenhuLineName.append(lineName)
            }
            
            if lineName.contains("淡水信義線") {
                shinyi.append(stationName)
                shinyiNumber.append(lineNumber)
                shinyiLineName.append(lineName)
            }
            
            if lineName.contains("新北投支線") {
                beito.append(stationName)
                beitoNumber.append(lineNumber)
                beitoLineName.append(lineName)
            }
            
            if lineName.contains("松山新店線") {
                xindian.append(stationName)
                xindianNumber.append(lineNumber)
                xindianLineName.append(lineName)
            }
            
            if lineName.contains("小碧潭支線") {
                bitan.append(stationName)
                bitanNumber.append(lineNumber)
                bitanLineName.append(lineName)
            }
            
            if lineName.contains("中和新蘆線") {
                shinru.append(stationName)
                shinruNumber.append(lineNumber)
                shinruLineName.append(lineName)
            }
            
            if lineName.contains("板南線") {
                bennan.append(stationName)
                bennanNumber.append(lineNumber)
                bennanLineName.append(lineName)
            }
            
            if lineName.contains("貓空纜車") {
                moukun.append(stationName)
                moukunNumber.append(lineNumber)
                moukunLineName.append(lineName)
            }
        }
        
        var stationData = [Station]()
        
        let wenhuArray = Station(lineName: "文湖線",stationName: wenhu, stationNumber: wenhuNumber, stationDetail: wenhuLineName)
        let shinyiArray = Station(lineName: "淡水信義線", stationName: shinyi, stationNumber: shinyiNumber, stationDetail: shinyiLineName)
        let beitoArray = Station(lineName: "新北投支線", stationName: beito, stationNumber: beitoNumber, stationDetail: beitoLineName)
        let xindianArray = Station(lineName: "松山新店線", stationName: xindian, stationNumber: xindianNumber, stationDetail: xindianLineName)
        let bitanArray = Station(lineName: "小碧潭支線", stationName: bitan, stationNumber: bitanNumber, stationDetail: bitanLineName)
        let shinruArray = Station(lineName: "中和新蘆線", stationName: shinru, stationNumber: shinruNumber, stationDetail: shinruLineName)
        let bennanArray = Station(lineName: "板南線", stationName: bennan, stationNumber: bennanNumber, stationDetail: bennanLineName)
        let moukunArray = Station(lineName: "貓空纜車", stationName: moukun, stationNumber: moukunNumber, stationDetail: moukunLineName)
        stationData.append(wenhuArray)
        stationData.append(shinyiArray)
        stationData.append(beitoArray)
        stationData.append(xindianArray)
        stationData.append(bitanArray)
        stationData.append(shinruArray)
        stationData.append(bennanArray)
        stationData.append(moukunArray)
        
        return stationData
 }
    
}
