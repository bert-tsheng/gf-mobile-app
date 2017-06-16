//
//  ListTableViewCell.swift
//  Sample
//
//  Created by Olivin Esguerra on 14/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var listTitleLbl: UILabel!
    @IBOutlet weak var listDateLbl: UILabel!
    @IBOutlet weak var listInfoLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(data:ItemModelItemMapper){
        self.listTitleLbl.text = data.event_name
        self.listDateLbl.text = data.start_date
        self.listInfoLbl.text = data.event_desc
    }
    
}
