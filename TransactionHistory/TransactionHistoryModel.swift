//
//  TransactionHistoryModel.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class TransactionHistoryModel: NSObject {
    var transactionId : String?
    var customerId : String?
    var amount : String?
    var closingBalance : String?
    var paymentMode : String?
    var paymentType : String?
    var paymentDateTime : String?
    
    init(json : [String: Any]) {
        if let customerId = json["customerId"] as? String
        {
            self.customerId = customerId
        }
        else if let customerId = json["customerId"] as? Int
        {
            self.customerId = "\(customerId)"
        }
        if let transactionId = json["transactionId"] as? String
               {
                   self.transactionId = transactionId
               }
               else if let transactionId = json["transactionId"] as? Int
               {
                   self.transactionId = "\(transactionId)"
               }
        if let amount = json["amount"] as? String {
                   self.amount = amount
               } else if let amount = json["amount"] as? Int {
                   self.amount = "\(amount)"
               }
               if let closingBalance = json["closingBalance"] as? String {
                   self.closingBalance = closingBalance
               } else if let paymentDateTime = json["paymentDateTime"] as? Int {
                   self.paymentDateTime = "\(paymentDateTime)"
               }
               if let paymentMode = json["paymentMode"] as? String {
                   self.paymentMode = paymentMode
               } else if let paymentMode = json["paymentMode"] as? Int {
                   self.paymentMode = "\(paymentMode)"
               }
               if let paymentType = json["paymentType"] as? String {
                   self.paymentType = paymentType
               } else if let paymentType = json["paymentType"] as? Int {
                   self.paymentType = "\(paymentType)"
               }
               
               if let paymentDateTime = json["paymentDateTime"] as? String {
                     self.paymentDateTime = paymentDateTime
                 } else if let paymentDateTime = json["paymentDateTime"] as? Int {
                     self.paymentDateTime = "\(paymentDateTime)"
                 }
    }
}
