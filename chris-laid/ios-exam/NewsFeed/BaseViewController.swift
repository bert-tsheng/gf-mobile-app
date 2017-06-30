//
//  BaseViewController.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import UIKit
import Foundation
import JGProgressHUD

class BaseViewController: UIViewController {
    
    let essentials = Essentials()
    let hud = JGProgressHUD()
    let services = Services()
    let constants = Constants()
    let articles = Articles()
    let navigationColor = UIColor(red: CGFloat(242), green: CGFloat(242), blue: CGFloat(242), alpha: CGFloat(1.0))
    let navigationTextColor = UIColor.darkGray

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = self.navigationColor
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: self.navigationTextColor]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
