//
//  ViewController.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var countryApiValueTableView: UITableView!
    @IBOutlet weak var collectionApiValue: UICollectionView!
    
    @IBOutlet weak var indiaButOutlet: UIButton!
    @IBOutlet weak var usaButOutlet: UIButton!
    @IBOutlet weak var chinaButOutlet: UIButton!
    @IBOutlet weak var australiaButOutlet: UIButton!
    @IBOutlet weak var businessButOutlet: UIButton!
    @IBOutlet weak var sportButOutlet: UIButton!
    @IBOutlet weak var healthButOutlet: UIButton!
    @IBOutlet weak var gamingButOutlet: UIButton!
    
    var country = "in"
    var category = "business"
    var countryView: APICalling = APICalling()
    var countryValueArray: CountryApiModel?
    var collectioArray: CountryApiModel?
    let activityView = UIActivityIndicatorView(style: .gray)
    var cgColorWhite = UIColor.white.cgColor
    var cgColorBlack = UIColor.black.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        showActivityIndicatory()
        countryButtonDesign(button: 1)
        categoryButtonDesign(button: 5)
        
        countryView.countryApiNews(country: "in", category: "business") { value in
            DispatchQueue.main.async { [self] in
                countryValueArray = value
                countryApiValueTableView.reloadData()
                collectionApiValue.reloadData()
                activityView.stopAnimating()
                activityView.hidesWhenStopped = true
            }
        }
    
        countryView.countryApiNews(country: "in", category: "business") { value in
            DispatchQueue.main.async { [self] in
                collectioArray = value
                collectionApiValue.reloadData()
            }
        }
    }
    
    // MARK: URL to Image Coverter Func
    func urlToImage(url: String) -> UIImage? {
        guard let data = try? Data(contentsOf: URL(string: url)! as URL) else { return nil }
        return UIImage(data: data, scale: -1)
    }
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryValueArray?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryApiValueTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        
        cell.imageOutlet.image = urlToImage(url: (countryValueArray?.articles?[indexPath.row].urlToImage) ?? "nil") ?? UIImage(systemName: "photo.artframe")
        cell.NewsName.text = countryValueArray?.articles?[indexPath.row].title
        cell.lable.text = countryValueArray?.articles?[indexPath.row].author
        
        cell.imageOutlet.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
    
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectioArray?.articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionApiValue.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCollectionViewCell
        
        cell.newsImageOutlet.image = urlToImage(url: collectioArray?.articles?[indexPath.row].urlToImage ?? "nil") ?? UIImage(systemName: "photo.artframe")
        cell.titleLableOutlet.text = collectioArray?.articles?[indexPath.row].title
        
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 291, height: 204)
    }
    
    func apiCaling(country: String, category: String) {
        countryView.countryApiNews(country: country, category: category) { value in
            DispatchQueue.main.async { [self] in
                countryValueArray = value
                countryApiValueTableView.reloadData()
            }
        }
    }
    
    //MARK: - Country Button
    @IBAction func indiaButAction(_ sender: Any) {
        country = "in"
        
        apiCaling(country: country, category: category)
        countryButtonDesign(button: 1)
    }
    @IBAction func usaButAction(_ sender: Any) {
        country = "us"
        
        apiCaling(country: country, category: category)
        countryButtonDesign(button: 2)
    }
    @IBAction func chinaButAction(_ sender: Any) {
        country = "ch"
        
        apiCaling(country: country, category: category)
        countryButtonDesign(button: 3)
    }
    @IBAction func australiaButAction(_ sender: Any) {
        country = "au"
        
        apiCaling(country: country, category: category)
        countryButtonDesign(button: 4)
    }
    
    // MARK: - Category Button
    @IBAction func businessButAction(_ sender: Any) {
        category = "business"
        
        apiCaling(country: country, category: category)
        categoryButtonDesign(button: 5)
    }
    @IBAction func sportButAction(_ sender: Any) {
        category = "sport"
        
        apiCaling(country: country, category: category)
        categoryButtonDesign(button: 6)
    }
    @IBAction func healthButAction(_ sender: Any) {
        category = "health"
        
        apiCaling(country: country, category: category)
        categoryButtonDesign(button: 7)
    }
    @IBAction func gamingButAction(_ sender: Any) {
        category = "gaming"
        
        apiCaling(country: country, category: category)
        categoryButtonDesign(button: 8)
    }
    
    // Did Select Function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = storyboard?.instantiateViewController(withIdentifier: "DidSelectNewsViewController") as! DidSelectNewsViewController
        
        select.countryImage = urlToImage(url: countryValueArray?.articles![indexPath.row].urlToImage ?? "nil")
        select.authorLable = countryValueArray?.articles?[indexPath.row].author ?? "nil"
        select.titleLable = countryValueArray?.articles?[indexPath.row].title ?? "nil"
        select.descriptionLable = countryValueArray?.articles?[indexPath.row].description ?? "nil"
        select.contantLable = countryValueArray?.articles?[indexPath.row].content ?? "nil"
        select.urlLable = countryValueArray?.articles?[indexPath.row].url ?? "nil"
        
        navigationController?.pushViewController(select, animated: true)
    }
    
    // country Button Design
    func countryButtonDesign(button: Int) {
        if indiaButOutlet.tag == button {
            countryButton(buttonCoutry: 0)
        }
        else if usaButOutlet.tag == button {
            countryButton(buttonCoutry: 1)
        }
        else if chinaButOutlet.tag == button {
            countryButton(buttonCoutry: 2)
        }
        else if australiaButOutlet.tag == button {
            countryButton(buttonCoutry: 3)
        }
    }
    
    // category Button Design
    func categoryButtonDesign(button: Int) {
        if businessButOutlet.tag == button {
            categoryButton(buttonCategory: 0)
        }
        else if sportButOutlet.tag == button {
            categoryButton(buttonCategory: 1)
        }
        else if healthButOutlet.tag == button {
            categoryButton(buttonCategory: 2)
        }
        else if gamingButOutlet.tag == button {
            categoryButton(buttonCategory: 3)
        }
    }
    
    func countryButton(buttonCoutry: Int) {
        let buttonOutlets = [indiaButOutlet, usaButOutlet, chinaButOutlet, australiaButOutlet]
        
        for (index, outlet) in buttonOutlets.enumerated() {
            if index == buttonCoutry {
                outlet?.layer.borderWidth = 2
                outlet?.layer.borderColor = cgColorBlack
            } else {
                outlet?.layer.borderWidth = 0
            }
        }
    }
    
    func categoryButton(buttonCategory: Int) {
        let buttonOutlets = [businessButOutlet, sportButOutlet, healthButOutlet, gamingButOutlet]
        
        for (index, outlet) in buttonOutlets.enumerated() {
            if index == buttonCategory {
                outlet?.layer.borderWidth = 2
                outlet?.layer.borderColor = cgColorBlack
            } else {
                outlet?.layer.borderWidth = 0
            }
        }
    }
    
    
    func showActivityIndicatory() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    // Dedign Func.
    func design() {
        indiaButOutlet.layer.cornerRadius = 5
        usaButOutlet.layer.cornerRadius = 5
        chinaButOutlet.layer.cornerRadius = 5
        australiaButOutlet.layer.cornerRadius = 5
        businessButOutlet.layer.cornerRadius = 5
        sportButOutlet.layer.cornerRadius = 5
        healthButOutlet.layer.cornerRadius = 5
        gamingButOutlet.layer.cornerRadius = 5
    }
    
}
