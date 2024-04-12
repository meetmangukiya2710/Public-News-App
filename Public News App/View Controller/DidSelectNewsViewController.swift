//
//  DidSelectNewsViewController.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import UIKit

class DidSelectNewsViewController: UIViewController {
    
    @IBOutlet weak var backButtonAction: UIButton!
    @IBOutlet weak var countryImageOutlet: UIImageView!
    @IBOutlet weak var authorLableOutlet: UILabel!
    @IBOutlet weak var titleLableOutlet: UILabel!
    @IBOutlet weak var descriptionLableOutlet: UILabel!
    @IBOutlet weak var contantlableOutlet: UILabel!
    @IBOutlet weak var urlLableOutlet: UILabel!
    
    var countryImage = UIImage(named: "")
    var authorLable = ""
    var titleLable = ""
    var descriptionLable = ""
    var contantLable = ""
    var urlLable = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        design()

        countryImageOutlet.image = countryImage ?? UIImage(systemName: "photo.artframe")
        authorLableOutlet.text = authorLable
        titleLableOutlet.text = titleLable
        descriptionLableOutlet.text = descriptionLable
        urlLableOutlet.text = urlLable
    }
    
    // Back Button Func.
    @IBAction func backButtonAction(_ sender: Any) {
//        let naviagte = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    func design() {
        backButtonAction.layer.borderWidth = 2
        backButtonAction.layer.borderColor = UIColor.gray.cgColor
        backButtonAction.layer.cornerRadius = 5
        
        countryImageOutlet.layer.cornerRadius = 25
    }

}
