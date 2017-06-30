//
//  Services.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import Foundation
import UIKit

class Services {
    
    let constants = Constants()
    
    func getNews(callback:@escaping (_ jsonDictionary: NSDictionary)->()){
        
        let url = NSURL(string: constants.bbcNews)
        
        request(url: url!){ json in
            
            callback(json)
            
        }
    }

    //Core Services functions
    private func request(url :NSURL, method:String = "GET", callback:@escaping (_ jsonResponse:NSDictionary)->()){
        let request = NSMutableURLRequest(url:url as URL);
        
        request.httpMethod = method
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let err = error {
                print("error: \(err.localizedDescription)")
                
            } else{
                do {
                    guard let data = data else {
                        throw JSONError.NoData
                    }
                    
                    guard let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary else {
                        throw JSONError.ConversionFailed
                    }
                    
                    callback(json)
                } catch let error as JSONError {
                    print(error.rawValue)
                } catch let error as NSError {
                    print(error.debugDescription)
                }
            }
            }.resume()
    }
}//end of class

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}
