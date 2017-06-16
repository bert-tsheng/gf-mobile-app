//
//  ListViewController.swift
//  Sample
//
//  Created by Olivin Esguerra on 14/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListViewController: UIViewController {
    
    @IBOutlet weak var contentTblView: UITableView!
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.contentTblView.estimatedRowHeight = 500
        
        self.contentTblView.dataSource = self
        self.contentTblView.delegate = self
        
        self.contentTblView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCellID")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SVProgressHUD.show()
        self.viewModel.getItems(mode: true, onSuccess: { (isSuccess) in
            SVProgressHUD.dismiss()
            self.contentTblView.reloadData()
        }, onFailed: { (errorTitle, errorMessage) in
            SVProgressHUD.dismiss()
        })
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

extension ListViewController :UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.viewModel.itemArray.count)
        return self.viewModel.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCellID") as! ListTableViewCell
        cell.loadData(data: self.viewModel.itemArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextVC = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "DetailViewControllerID") as! DetailViewController
        nextVC.model = self.viewModel.itemArray[indexPath.row]
        nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
