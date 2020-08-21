//
//  TransactionHistoryModel.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class TranxHistoryModdel: NSObject {
    var transaction_id:String?
    var customer_id :String?
    var amount :String?
    var closing_balance:String?
    var payment_mode:String?
    var payment_type:String?
    var payment_datetime:String?
    
    init(json:[String:Any]) {
        if let customer_id = json["customer_id"] as? String {
            self.customer_id = customer_id
        } else if let customer_id = json["customer_id"] as? Int {
            self.customer_id = "\(customer_id)"
        }
        if let id = json["transaction_id"] as? String {
            self.transaction_id = id
        } else if let id = json["transaction_id"] as? Int {
            self.transaction_id = "\(id)"
        }
        if let amount = json["amount"] as? String {
            self.amount = amount
        } else if let amount = json["amount"] as? Int {
            self.amount = "\(amount)"
        }
        if let closing_balance = json["closing_balance"] as? String {
            self.closing_balance = closing_balance
        } else if let closing_balance = json["closing_balance"] as? Int {
            self.closing_balance = "\(closing_balance)"
        }
        if let payment_mode = json["payment_mode"] as? String {
            self.payment_mode = payment_mode
        } else if let payment_mode = json["payment_mode"] as? Int {
            self.payment_mode = "\(payment_mode)"
        }
        if let payment_type = json["payment_type"] as? String {
            self.payment_type = payment_type
        } else if let payment_type = json["payment_type"] as? Int {
            self.payment_type = "\(payment_type)"
        }
        
        if let payment_datetime = json["payment_datetime"] as? String {
              self.payment_datetime = payment_datetime
          } else if let payment_datetime = json["payment_datetime"] as? Int {
              self.payment_datetime = "\(payment_datetime)"
          }
    }
}
