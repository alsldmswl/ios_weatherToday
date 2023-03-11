//
//  weather.swift
//  WeatherToday
//
//  Created by eun-ji on 2023/03/10.
//

import Foundation

struct Country: Codable {
    
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
    
}

struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Double
    
    var fahrenheit: Double{
        return round((self.celsius * 1.8 + 32) * 10) / 10
    }
    var degree: String{
        return "섭씨 \(self.celsius)도 / 화씨 \(self.fahrenheit)도"
    }

    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state
        case celsius
        case rainfallProbability = "rainfall_probability"
    }
}
