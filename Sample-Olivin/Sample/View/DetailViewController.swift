//
//  DetailViewController.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var contentTblView: UITableView!
    
    var model : ItemModelItemMapper!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.contentTblView.estimatedRowHeight = 500
        self.contentTblView.delegate = self
        self.contentTblView.dataSource = self
        
        self.contentTblView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCellID")
        self.contentTblView.register(UINib(nibName: "SubHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "SubHeaderTableViewCellID")
        self.contentTblView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCellID")
        self.contentTblView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCellID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController :UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCellID") as! HeaderTableViewCell
            cell.titleLbl.text = model.event_name
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubHeaderTableViewCellID") as! SubHeaderTableViewCell
            cell.subHeaderLbl.text = model.start_date
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCellID") as! ImageTableViewCell
            
            SDWebImageManager.shared().downloadImage(with: URL(string: model.images[0].path), options: [.cacheMemoryOnly], progress: { (receivedSize, expectedSize) in
                
            }, completed: { (image, error, cacheType, finished, url) in
                
                if error != nil {
                    //cell.bannerImgView.image = UIImage(named: "ic_placeholder")
                } else {
                    cell.bannerImgView.image = image
                    SDImageCache.shared().store(image, forKey: self.model.images[0].path)
                }
                
                cell.setNeedsLayout()
                
            })
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCellID") as! DescriptionTableViewCell
        
        cell.itemDescLbl.text = "Five high school kids with different personalities are infused with unique superpowers are then forced to harness those powers as a team to save the world."
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2 {
            return 200
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
