//
//  MainCell.swift
//  WeatherToday
//
//  Created by eun-ji on 2023/03/10.
//

import UIKit

class MainCell: UITableViewCell {
    
    
    @IBOutlet weak var countryImg: UIImageView!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var chevronImg: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
