//
//  NewsListViewController.swift
//  NewsFeed
//
//  Created by Chrisler Laid on 30/06/2017.
//  Copyright © 2017 Joio. All rights reserved.
//

import UIKit

class NewsListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    var selectedIndex = Int()
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadNews), for: .valueChanged)
        
        loadNews()
        
        myTableView.addSubview(refreshControl)
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadNews() {
        DispatchQueue.global(qos: .background).async {
            self.services.getNews(callback: { json in
                DispatchQueue.main.async {
                    self.articles.parseNewsArticles(json: json)
                    self.myTableView.reloadData()
                    self.refreshControl?.endRefreshing()
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newsArticleCell:NewsArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsArticleTableViewCell") as! NewsArticleTableViewCell
        
        let row = indexPath.row
        
        newsArticleCell.titleString = articles.newsArticles[row]["title"]!
        newsArticleCell.contentString = articles.newsArticles[row]["description"]!
        newsArticleCell.imageUrlString = articles.newsArticles[row]["urlToImage"]!
        
        return newsArticleCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return CGFloat(160)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "segueToDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailsVC = segue.destination as!  NewsDetails
        detailsVC.articleDetails = articles.newsArticles[selectedIndex]
    }
    
}//end of class
