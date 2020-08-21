//
//  APIManager.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    static let sharedInstance = APIManager()
       func serverCall(firstURl:String = "https://api-7033.tookanapp.com:444/",apiName:String,params: [String : AnyObject]?,httpMethod:String,receivedResponse:@escaping (_ succeess:Bool, _ response:[String:Any]) -> ()) {
           
           print(params ?? "")
           
          serverRequest(firstUrl: firstURl, apiName, params: params!, httpMethod: httpMethod, isZipped: false) { (succeess:Bool, response:[String:Any]) -> () in
               DispatchQueue.main.async {
                   if(succeess){
                       if let status = response["status"] as? Int {
                           
                           switch(status) {
                           case STATUS_CODES.SHOW_DATA:
                               DispatchQueue.main.async(execute: { () -> Void in
                                   receivedResponse(true, response)
                               })
                               break
                           case STATUS_CODES.INVALID_ACCESS_TOKEN:
                               receivedResponse(false, response)
                               break
                           case STATUS_CODES.SHOW_MESSAGE:
                               receivedResponse(false, response)
                               break
                           default:
                               receivedResponse(false, response)
                           }
                       } else {
                           receivedResponse(false, ["message":"server not responding"])
                       }
                   } else {
                       receivedResponse(false, ["message":"server not responding"])
                       
                   }
               }
           }
           
       }
}
