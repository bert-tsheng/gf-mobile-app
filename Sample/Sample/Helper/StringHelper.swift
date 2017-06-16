//
//  StringHelper.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

extension String {
    
    func removeUnderScore()->String{
        return self.replacingOccurrences(of: "_", with: " ")
    }
    
    func convertToDateMMMddyyyy(stringDate : String) -> Date{
        print(stringDate.replacingOccurrences(of: ",", with: ", "))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        dateFormatter.locale =  NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT+0:00")! as TimeZone
        
        return dateFormatter.date(from: stringDate.replacingOccurrences(of: ",", with: ", "))!
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    func getDateFromServer(dateString : String)->String{
        let dateStringArr = dateString.components(separatedBy: " ")
        return dateStringArr[1] + " " + dateStringArr[2]
    }
    
    func getDateFromStartDate(start_date : String)->Date{
        let stringArr = start_date.components(separatedBy: " ")
        let dateString = stringArr[1] + " " + stringArr[2]
        print(dateString)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        dateFormatter.locale =  NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT+0:00")! as TimeZone
        
        let date = dateFormatter.date(from: dateString)
        return date!
    }
}

