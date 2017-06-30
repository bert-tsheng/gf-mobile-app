//
//  Articles.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import Foundation

class Articles {
    
    var newsArticles = [[String:String]]()
    var fields = ["title", "description", "urlToImage", "publishedAt", "author"]
    
    func parseNewsArticles(json: NSDictionary) {
        if let articles = json["articles"] as? [[String:Any]] {
   
            var body_tmp = [String:String]()
   
            for article in articles {
                for field in fields {
                    if let tmp_field = article[field] as? String {
                        body_tmp[field] = tmp_field;
                    }
                }
                
                newsArticles.append(body_tmp)
                
            }//end of for in
        }//end of if let articles
    }//end of func parseNewsArticles
}//end of class
