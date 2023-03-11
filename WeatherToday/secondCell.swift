//
//  secondCell.swift
//  WeatherToday
//
//  Created by eun-ji on 2023/03/10.
//

import UIKit

class secondCell: UITableViewCell {
    
    
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    
    @IBOutlet weak var rainfallLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
