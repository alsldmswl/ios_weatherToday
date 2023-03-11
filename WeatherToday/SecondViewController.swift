//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by eun-ji on 2023/03/10.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var countryName: String?
    var nationAsset: String?
    var cities: [City] = []
    
    @IBOutlet weak var secondTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondTableView.dataSource = self
        secondTableView.delegate = self
        self.navigationItem.title = self.countryName
        
        let jsonDecoder: JSONDecoder = JSONDecoder()

        guard let dataAsset: NSDataAsset = NSDataAsset(name: self.nationAsset!) else {return}

        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
            
        } catch {
            print(error)
        }
        self.secondTableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! secondCell
        cell.nameLabel.text = cities[indexPath.row].cityName
        
        cell.celsiusLabel.text = cities[indexPath.row].degree
        if(cities[indexPath.row].celsius >= 25){
            cell.celsiusLabel.textColor = .red
        }
        if(cities[indexPath.row].celsius <= 10) {
            cell.celsiusLabel.textColor = .blue
        }
        
        let rainProbability: Int = Int(cities[indexPath.row].rainfallProbability)
        cell.rainfallLabel.text = "강수확률" + String(rainProbability) + "%"
        if rainProbability >= 50 {
            cell.rainfallLabel.textColor = .orange
        }
        
        cell.accessibilityIdentifier = String(cities[indexPath.row].state)
        
        
        let weatherImageName:String = getStateText(cities[indexPath.row].state)
        cell.weatherImg.image = UIImage(named: weatherImageName)
        
        return cell
      
    }
    
    func getStateText(_ state: Int) -> String {
        switch state {
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return "sunny"
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thirdVC: ThirdViewController = segue.destination as? ThirdViewController else {return}
        
        guard let cell: secondCell = sender as? secondCell else {return}
        
        thirdVC.textForTemperatureLabel = cell.celsiusLabel.text
        thirdVC.textForRainProbability = cell.rainfallLabel.text
        thirdVC.imageForWeatherImageView = cell.weatherImg.image
        thirdVC.numberOfWeatherState = cell.accessibilityIdentifier
        
        thirdVC.colorForTemperatureLabel = cell.celsiusLabel.textColor
        thirdVC.colorForRainProbabilityLabel = cell.rainfallLabel.textColor
        
        cell.isSelected = false
    }
   

}
