//
//  SerachPageViewController.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import UIKit

class SerachPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var newsSearchBarOutlet: UISearchBar!
    @IBOutlet weak var newsListTableView: UITableView!
    @IBOutlet weak var titleLableOutlet: UILabel!
    
    var searchApiObj: NewsViewModel = NewsViewModel()
    var searchValueArray: SearchApiModel?
    var searchTitle = ""
    let activityView = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicatory()
        
        searchApiObj.searchNewsCalling(topic: "tesla") { [self] news in
            DispatchQueue.main.sync {
                searchValueArray = news
                newsListTableView.reloadData()
                activityView.stopAnimating()
                activityView.hidesWhenStopped = true
            }
        }
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        titleLableOutlet.text = newsSearchBarOutlet.text
        searchTitle = newsSearchBarOutlet.text ?? "nil"
        showActivityIndicatory()
        
        searchApiObj.searchNewsCalling(topic: searchTitle) { [self] news in
            DispatchQueue.main.sync {
                searchValueArray = news
                newsListTableView.reloadData()
                activityView.stopAnimating()
                activityView.hidesWhenStopped = true
            }
        }
    }
    
    // MARK: URL to Image Coverter Func
//    func urlToImage(url: String) -> UIImage? {
//        guard let data = try? Data(contentsOf: URL(string: url)! as URL) else { return nil }
//        return UIImage(data: data, scale: -1)
//    }
    
    func urlToImage(url: String) -> UIImage? {
        guard let urlObject = URL(string: url) else {
            // Handle the case where URL creation fails
            return nil
        }
        
        guard let data = try? Data(contentsOf: urlObject) else {
            // Handle the case where data retrieval fails
            return nil
        }
        
        return UIImage(data: data)
    }
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchValueArray?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsListTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! SearchTableViewCell
        
        cell.newsImageOutlet.image = urlToImage(url: searchValueArray?.articles![indexPath.row].urlToImage ?? "nil") ?? UIImage(systemName: "photo.artframe")
        cell.newsTitleOutlet.text = searchValueArray?.articles![indexPath.row].title
        
        cell.newsImageOutlet.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    // MARK: Did Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = storyboard?.instantiateViewController(withIdentifier: "DidSelectNewsViewController") as! DidSelectNewsViewController
        
        select.countryImage = urlToImage(url: (searchValueArray?.articles![indexPath.row].urlToImage ?? "nil"))
        select.authorLable = (searchValueArray?.articles?[indexPath.row].author ?? "nil")
        select.titleLable = (searchValueArray?.articles?[indexPath.row].title ?? "nil")
        select.descriptionLable = (searchValueArray?.articles?[indexPath.row].description ?? "nil")
        select.contantLable = (searchValueArray?.articles?[indexPath.row].content ?? "nil")
        select.urlLable = (searchValueArray?.articles?[indexPath.row].url ?? "nil")
        
        navigationController?.pushViewController(select, animated: true)
    }
    
    func showActivityIndicatory() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
}
