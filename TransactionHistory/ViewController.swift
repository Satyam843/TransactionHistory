//
//  ViewController.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    var currentWeekDate:Date!
       let model = DateModel()
       var currentDate = ""
       var isLoadingList : Bool = false
    var currentPage : Int = 0
       var currentDateIndex = 0
       var numberOfDays = 7
       var formatter = DateFormatter()
       var endDate:String = ""
       var startDate:String = ""
       let headerHeight:CGFloat = 40.0
       var starting_datetime:String = ""
       var beginDay:String = ""
       var endDay:String = ""
       var ending_datetime:String = ""
    var transactionModel : TransactionHistoryModel?
    var transactionArrayCount = -1
    var transactionArrayModel = [TransactionHistoryModel]()
       var back_Date = Calendar.current.date(byAdding: .day, value: -6, to: Date())!
       var forward_Date = Calendar.current.date(byAdding: .day, value: -6, to: Date())!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.btnLeft.addTarget(self, action: #selector(self.leftButtonAction), for: .touchUpInside)
              self.btnRight.addTarget(self, action: #selector(self.rightButtonAction), for: .touchUpInside)
              self.setCenterLabel(startDate: self.startDate, endDate: self.endDate, currentDateIndex: self.currentDateIndex)
    }
    func transactionHistory(beginDateParam: String,endDateParam : String,displayStart : Int = 0)
    {
   let params = ["access_token": "a8ffd457ffd3ed21cdc424c8915f7e3a",
       "end_date": endDateParam,
       "is_customer": "1",
       "timezone": Singleton.sharedInstance.getTimeZone(),
       "is_pagination":1,
       "limit": "20",
       "off_set": displayStart,
       "start_date": beginDateParam] as [String : Any]
        print(params)
        APIManager.sharedInstance.serverCall(apiName: API_NAME.fetch_transactions, params: params as [String : AnyObject]?, httpMethod: HTTP_METHOD.POST) { (isTrue, response) in
            if isTrue == true
            {
                if let data = response["data"] as? [[String:Any]]{
                    self.transactionArrayCount = data.count
                    for item in data{
                        self.transactionModel = TransactionHistoryModel(json: item)
                        self.transactionArrayModel.append(TransactionHistoryModel(json: item))
                        Singleton.sharedInstance.transactionModel = TransactionHistoryModel(json: item)
                        //self.detailTableView.reloadData()
                    }
                    // self.detailTableView.reloadData()
                }
            }
            else
            {
                print("Error")
            }
        }
    }
    
    @objc func leftButtonAction() {
           self.forward_Date = self.back_Date
           self.back_Date = Calendar.current.date(byAdding: .day, value: -6, to: forward_Date)!
           formatter.dateFormat = "dd"
           let back = formatter.string(from: self.back_Date)
           let forward = formatter.string(from: self.forward_Date)
           self.endDate = forward
           self.startDate = back
           formatter.dateFormat = "MMMM"
           let month = formatter.string(from: self.forward_Date)
           formatter.dateFormat = "yyyy"
           let year = formatter.string(from: self.forward_Date)
           self.setCenterLabelHistory(startDate: back, endDate: forward, month: month, year: year)
           formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           self.starting_datetime = formatter.string(from: self.back_Date)
           self.ending_datetime = formatter.string(from: self.forward_Date)
         self.transactionHistory(beginDateParam: starting_datetime, endDateParam: ending_datetime, displayStart: currentPage)
       }
       @objc func rightButtonAction() {
           formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           self.back_Date = self.forward_Date
           self.forward_Date = Calendar.current.date(byAdding: .day, value: 6, to: self.forward_Date)!
           formatter.dateFormat = "dd"
           let back = formatter.string(from: self.back_Date)
           let forward = formatter.string(from: self.forward_Date)
           self.endDate = forward
           self.startDate = back
           
           formatter.dateFormat = "MMMM"
           let month = formatter.string(from: self.forward_Date)
           formatter.dateFormat = "yyyy"
           let year = formatter.string(from: self.forward_Date)
           self.setCenterLabelHistory(startDate: back, endDate: forward, month: month, year: year)
           formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           self.starting_datetime = formatter.string(from: self.back_Date)
           self.ending_datetime = formatter.string(from: self.forward_Date)
           //self.tranxArrayModel.removeAll()
        self.transactionHistory(beginDateParam: starting_datetime, endDateParam: ending_datetime, displayStart: currentPage)
       }
       
       
       func setCenterLabel(startDate:String, endDate:String,currentDateIndex:Int)   {
           let month = model.getDateSlotForRepeatPopup(indexPath: currentDateIndex + 6, format: "MMMM")
           let year = model.getDateSlotForRepeatPopup(indexPath: currentDateIndex + 6, format: "YYYY")
           let formatter = DateFormatter()
           formatter.dateFormat = "dd"
           let today = Date()
           let backDate = Calendar.current.date(byAdding: .day, value: -6, to: today)!
           let backDateFormatted = formatter.string(from: backDate)
           let forwardDateFormatted = formatter.string(from:today)
           self.lblDate.text = " \(backDateFormatted)-\(forwardDateFormatted)\(month) \(year)"
           formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           self.beginDay = formatter.string(from: today)
           self.endDay = formatter.string(from:backDate)
       }
       func setCenterLabelHistory(startDate:String, endDate:String,month:String, year:String)   {
           self.lblDate.text = "\(startDate)-\(endDate) \(month) \(year)"
       }
       func getDateSlotForNextPrevious(currentDateIndex:Int,currentDate:String) -> String {
           print(currentDateIndex)
           let calendar = NSCalendar.current
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           let yourDate = formatter.date(from: currentDate)
           self.currentWeekDate = yourDate
           let newDate:Date = (calendar as NSCalendar).date(byAdding: .day, value: currentDateIndex, to:  self.currentWeekDate!, options: [])!
           let dateInString = newDate.convertUTCDateToString("yyyy-MM-dd")
           
           return dateInString
       }
       


}
class DateModel: NSObject {
    func getcurrentDate() -> Date {
        let styler = DateFormatter()
        styler.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        styler.timeZone = TimeZone.autoupdatingCurrent
        styler.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        let currentDateString = styler.string(from: Date())
        styler.timeZone = TimeZone(abbreviation:  "UTC")
        return (styler.date(from: currentDateString))!
    }
    func getDateSlotForRepeatPopup(indexPath:Int, format:String) -> String {
        let calendar = NSCalendar.current
        let dateFormatter = DateFormatter()
        let currentDate = getcurrentDate()
        let newDate:Date = (calendar as NSCalendar).date(byAdding: .day, value: indexPath, to: currentDate, options: [])!
        dateFormatter.timeZone = TimeZone(abbreviation:"UTC")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: newDate)
    }
}
public extension Date {
    func changeDaysBy(days : Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.day = days
    return NSCalendar.current.date(byAdding: dateComponents, to: self)!
    }
    func convertUTCDateToString(_ format:String) -> String {
         let formatter = DateFormatter()
         formatter.dateFormat = format
         formatter.timeZone = TimeZone(identifier: "UTC")
         return formatter.string(from: self)
     }
}


