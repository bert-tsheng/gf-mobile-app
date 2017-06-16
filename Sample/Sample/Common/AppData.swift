//
//  AppData.swift
//  Sample
//
//  Created by Olivin Esguerra on 14/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit


class AppData: NSObject {
    
    var token : String!

    class var sharedInstance: AppData {
        struct Static {
            static let instance = AppData()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        
    }
    
    
}
