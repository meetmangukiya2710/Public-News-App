//
//  SearchTableViewCell.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageOutlet: UIImageView!
    @IBOutlet weak var newsTitleOutlet: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
