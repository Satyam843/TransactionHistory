//
//  serverCall.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import Foundation

func serverRequest(firstUrl:String = "https://api-7033.tookanapp.com:444/",_ url: String, params: [String:AnyObject], httpMethod: String, isZipped:Bool, receivedResponse:@escaping (_ succeess:Bool, _ response:[String:Any]) -> ()){

    let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    var request = URLRequest(url: URL(string: (firstUrl) + urlString!)!)
    request.httpMethod = httpMethod as String
    request.timeoutInterval = 20
    print(request)
    if(httpMethod == "POST")
    {
        request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        if isZipped == false {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } else {
            request.addValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
            request.addValue("application/octet-stream", forHTTPHeaderField: "Content-Encoding: gzip")
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    }

    let task = URLSession.shared.dataTask(with: request) {data, response, error in
        if(response != nil && data != nil) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                    receivedResponse(true, json)
                } else {
                    let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("Error could not parse JSON: \(jsonStr ?? "none")")
                    receivedResponse(false, [:])
                }
            } catch let parseError {
                print(parseError)
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Error could not parse JSON: '\(jsonStr ?? "none")'")
                receivedResponse(false, [:])
            }
        } else {
            receivedResponse(false, [:])
        }
    }
    task.resume()
}




