//
//  ItemModel.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import ObjectMapper


struct ItemModel: Mappable {
    
    var result : ItemModelResultDataMapper!
    
    init() {
        
    }
    
    init?(map: Map){
        
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
    }
}

struct ItemModelResultDataMapper : Mappable{
    
    var total : Int!
    var per_page : Int!
    var current_page : Int!
    var last_page : Int!
    var next_page_url : String!
    var prev_page_url : String!
    var from : Int!
    var to : Int!
    
    var result : [ItemModelItemMapper]!
    
    init?(map: Map){
        
    }
    
    mutating func mapping(map: Map) {
        
        total <- map["total"]
        per_page <- map["per_page"]
        current_page <- map["current_page"]
        last_page <- map["last_page"]
        next_page_url <- map["next_page_url"]
        prev_page_url <- map["prev_page_url"]
        from <- map["from"]
        to <- map["to"]
        
        result <- map["data"]
    }
}


class ItemModelItemMapper :  Mappable {
    
    var event_id : Int!
    var event_name : String!
    var event_excerpt : String!
    var event_desc : String!
    var address : String!
    var start_date : String!
    var end_date : String!
    var event_type : String!
    var lat : String!
    var lng : String!
    var like_count : Int!
    var created_at : String!
    var updated_at : String!
    var interested_count : Int!
    var images : [ItemModelImageItemMapper]! = []
    var price : String!

    required init?(map: Map){
        
    }
    
    
    func mapping(map: Map) {
        event_id <- map["event_id"]
        event_name <- map["event_name"]
        event_excerpt <- map["event_excerpt"]
        event_desc <- map["event_desc"]
        address <- map["address"]
        start_date <- map["start_date"]
        end_date <- map["end_date"]
        event_type <- map["event_type"]
        lat <- map["lat"]
        lng <- map["lng"]
        like_count <- map["like_count"]
        interested_count <- map["interested_count"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        images <- map["images"]
        price <- map["price"]
        
        print(lat)
        print(lng)
    }
    
    
}

struct ItemModelImageItemMapper :  Mappable{
    
    var id : Int!
    var name : String!
    var path : String!
    var width : Int!
    var height : Int!
    var event_id : Int!
    var created_at : String!
    var updated_at : String!
    
    
    
    init?(map: Map){
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        path <- map["path"]
        width <- map["width"]
        height <- map["height"]
        event_id <- map["event_id"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
    }
}

