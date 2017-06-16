//
//  TabControllerViewController.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class TabControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let item1 = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "ListViewControllerID") as! ListViewController
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home"))
        item1.tabBarItem = icon1
        
        let navBar1 = UINavigationController(rootViewController: item1)
        
        let item2 = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "ListViewControllerID") as! ListViewController
        let icon2 = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home"))
        item2.tabBarItem = icon2
        
        let navBar2 = UINavigationController(rootViewController: item2)
        
        let item3 = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "ListViewControllerID") as! ListViewController
        let icon3 = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home"))
        item3.tabBarItem = icon3
        
        let navBar3 = UINavigationController(rootViewController: item3)
        
        let item4 = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "ListViewControllerID") as! ListViewController
        let icon4 = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home"))
        item4.tabBarItem = icon4
        
        let navBar4 = UINavigationController(rootViewController: item4)
        
        self.viewControllers = [navBar1,navBar2,navBar3,navBar4]
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
