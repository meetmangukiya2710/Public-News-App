//
//  CountryTableViewCell.swift
//  Public News App
//
//  Created by R95 on 10/04/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var NewsName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
