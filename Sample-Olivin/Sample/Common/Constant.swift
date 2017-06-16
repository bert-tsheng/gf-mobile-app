//
//  Constant.swift
//  Sample
//
//  Created by Olivin Esguerra on 14/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

struct API {
    static let GOOGKLEAPIKEY = "1054130605472-rml3b2j4k7f1pgr9pn9st2c0036vg7tm.apps.googleusercontent.com"
    static let BASEURL = "http://104.236.3.75/gimik/api/public"
    
    struct LOGIN {
        static let URL = "/api/v1/auth/login"
    }
    
    
    struct FRESH {
        static let URL = "/api/v1/events/fresh"
    }

}

struct STORYBOARD {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
}
