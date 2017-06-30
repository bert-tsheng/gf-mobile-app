//
//  Essentials.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import Foundation
import UIKit

class Essentials {
    func downloadImageFromUrl(imageUrlString: String) -> UIImage {
        var dataImage = UIImage()
        
        if let url = NSURL(string: imageUrlString) {
            if let imageData = NSData(contentsOf: url as URL) {
                let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
                let data: NSData = NSData(base64Encoded: str64 , options: .ignoreUnknownCharacters)!
                dataImage = UIImage(data: data as Data)!
            }
        }
        
        return dataImage
    }

}
