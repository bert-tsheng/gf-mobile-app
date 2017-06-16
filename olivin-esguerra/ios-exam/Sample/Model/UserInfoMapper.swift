//
//  UserInfoMapper.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import ObjectMapper

struct UserInfoMapper: Mappable {

    var token : String!
    
    init?(map: Map){
        
    }
    
    
    mutating func mapping(map: Map) {
        token <- map["token"]
    }

}

