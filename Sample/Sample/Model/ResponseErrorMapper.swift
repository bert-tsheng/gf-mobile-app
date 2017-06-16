//
//  ResponseErrorMapper.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import ObjectMapper



struct ResponseErrorMapper : Mappable {
    var error : String!
    var errorArr : [String]!
    var errorString : String!
    
    init?(map: Map){
        errorString = ""
    }
    
    mutating func mapping(map: Map) {
        error <- map["error"]
        errorArr <- map["message"]
        
        
        
        if errorArr != nil {
            if errorArr.count > 0{
                var i = 0
                for objString in errorArr {
                    errorString.append(objString)
                    
                    if i < errorArr.count - 1{
                        errorString.append("\n")
                    }
                    i += 1
                }
            }
        }else{
            errorString <- map["message"]
        }
        
    }
}

