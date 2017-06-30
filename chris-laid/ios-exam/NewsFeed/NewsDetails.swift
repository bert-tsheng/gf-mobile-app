//
//  NewsDetails.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import UIKit

class NewsDetails: BaseViewController {
    
    @IBOutlet weak var newsUIImage: UIImageView!
    @IBOutlet weak var newsTitleOutlet: UILabel!
    @IBOutlet weak var AuthorOutlet: UILabel!
    @IBOutlet weak var dateOutlet: UILabel!
    @IBOutlet weak var contentOutlet: UITextView!
    
    var articleDetails = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        newsTitleOutlet.text = articleDetails["title"]
        AuthorOutlet.text = articleDetails["author"]
        contentOutlet.text = articleDetails["description"]
        newsUIImage.image = essentials.downloadImageFromUrl(imageUrlString: articleDetails["urlToImage"]!)
        
        let str = articleDetails["publishedAt"]
        let index = str?.index((str?.startIndex)!, offsetBy: 10)
        dateOutlet.text = str?.substring(to: index!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
