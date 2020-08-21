//
//  Singleton.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class Singleton: NSObject {
    static let sharedInstance = Singleton()
      var tranxModel:TranxHistoryModdel?
    func getTimeZone() -> Int {
           let timezone = -(NSTimeZone.system.secondsFromGMT() / 60)
           return timezone
       }
}
