//
//  ThirdViewController.swift
//  WeatherToday
//
//  Created by eun-ji on 2023/03/11.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainProbabilityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    
    
    
    
    var textForTemperatureLabel: String?
    var textForRainProbability: String?
    var imageForWeatherImageView:UIImage?
    var numberOfWeatherState: String?
    
    var colorForTemperatureLabel: UIColor?
    var colorForRainProbabilityLabel: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.temperatureLabel.text = self.textForTemperatureLabel
        self.temperatureLabel.textColor = self.colorForTemperatureLabel
        
        self.rainProbabilityLabel.text = self.textForRainProbability
        self.rainProbabilityLabel.textColor = self.colorForRainProbabilityLabel
        
        self.weatherImageView.image = self.imageForWeatherImageView
        self.weatherLabel.text = getStateTextOfKorean(self.numberOfWeatherState!)
        // Do any additional setup after loading the view.
    }
    
    func getStateTextOfKorean(_ state: String) -> String {
        switch state{
        case "10":
            return "맑음"
        case "11":
            return "구름"
        case "12":
            return "비"
        case "13":
            return "눈"
        default:
            return "맑음"
        }
    }

}
