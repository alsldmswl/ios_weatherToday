//
//  ViewController.swift
//  WeatherToday
//
//  Created by eun-ji on 2023/03/10.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var MaintableView: UITableView!
   
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "세계 날씨"
        
        MaintableView.dataSource = self
        MaintableView.delegate = self
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {return}
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error)
        }
        self.MaintableView.reloadData()
        
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainCell
        
        let nationFlagImageName: String = "flag_" + countries[indexPath.row].assetName
        cell.accessibilityIdentifier = countries[indexPath.row].assetName
        
        cell.countryImg.image = UIImage(named: nationFlagImageName)
        cell.countryNameLabel.text = countries[indexPath.row].koreanName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC: SecondViewController = segue.destination as? SecondViewController else {return}
        
        guard let cell: MainCell = sender as? MainCell else {return}
        
        secondVC.countryName = cell.countryNameLabel.text
        secondVC.nationAsset = cell.accessibilityIdentifier
        cell.isSelected = false
    }
    
}

