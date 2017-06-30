//
//  NewsArticleTableViewCell.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import UIKit
import SDWebImage

class NewsArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleLabelOutlet: UILabel!
    @IBOutlet weak var contentLabelOutlet: UILabel!
    
    var imageUrlString = String()
    var titleString = String()
    var contentString = String()
    var essentials = Essentials()

    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabelOutlet.text = titleString
        contentLabelOutlet.text = contentString
        imageOutlet.image = essentials.downloadImageFromUrl(imageUrlString: imageUrlString)
    }

}
