//
//  Weather.swift
//  weather-app-ios
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var temperature: Temperature
    var wind: Wind
    var weatherPredictions: [WeatherPrediction]
    var city: String
    
    private enum CodingKeys: String, CodingKey {
        case weather
        case main
        case wind
        case city = "name"
        
        enum MainKeys: String, CodingKey {
            case temperature = "temp"
            case minTemperature = "temp_min"
            case maxTemperature = "temp_max"
            case feelsLike = "feels_like"
            case humidity
        }
        
        enum WindKeys: String, CodingKey {
            case speed
            case degree = "deg"
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let main = try container.nestedContainer(keyedBy: CodingKeys.MainKeys.self, forKey: .main)
        let wind = try container.nestedContainer(keyedBy: CodingKeys.WindKeys.self, forKey: .wind)
        
        let temperature = try main.decode(Double.self, forKey: .temperature)
        let minTemperature = try main.decode(Double.self, forKey: .minTemperature)
        let maxTemperature = try main.decode(Double.self, forKey: .maxTemperature)
        let feelsLike = try main.decode(Double.self, forKey: .feelsLike)
        let humidity = try main.decode(Double.self, forKey: .humidity)
        
        let windSpeed = try wind.decode(Double.self, forKey: .speed)
        
        let windDegree: Double;
        
        if let decodedDegree = try wind.decodeIfPresent(Double.self, forKey: .degree) {
            windDegree = decodedDegree
        } else {
            windDegree = 0
        }
        
        let weatherPredictions = try container.decode([WeatherPrediction].self, forKey: .weather)
        
        let city = try container.decode(String.self, forKey: .city)
        
        self.temperature = Temperature(current: temperature, minTemperature: minTemperature, maxTemperature: maxTemperature, feelsLike: feelsLike, humidity: humidity)
        
        self.wind = Wind(speed: windSpeed, degree: windDegree)
        
        self.weatherPredictions = weatherPredictions
        
        self.city = city
    }
}

struct WeatherPrediction: Decodable {
    var main: String
    var description: String
    var iconId: String
    var iconUrl: URL {
        get {
            return URL(string: "http://openweathermap.org/img/w/\(iconId).png")!
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case main
        case description
        case iconId = "icon"
    }
}

struct Temperature {
    var current: Double
    var minTemperature: Double
    var maxTemperature: Double
    var feelsLike: Double
    var humidity: Double
}

struct Wind {
    var speed: Double
    var degree: Double
}
