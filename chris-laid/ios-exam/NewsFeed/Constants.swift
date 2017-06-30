//
//  Constants.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import Foundation

import Foundation
import UIKit
class Constants {
   
    let baseURL = "https://newsapi.org/v1/articles?"
    let source = "bbc-news"
    let apiKey = "3c48734ada224b808e56c5b2fd7c8e11"
    
    var bbcNews: String {
        get {
            return baseURL + "source=" + source + "&apiKey=" + apiKey
        }
    }

}
