//
//  Weather.swift
//  weather-app-ios
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation

struct Weather {
    var temperature: Temperature
    var wind: Wind
    var description: String
    var iconUrl: String
    var chanceOfRain: Double
}

struct Temperature {
    var temperature: Double
    var minTemperature: Double
    var maxTemperature: Double
    var feelsLike: Double
}

struct Wind {
    var speed: Double
    var degree: Double
    var direction: String
}

class WeatherUtils {
    static func decodeFromJson(dictionary: [String: Any]) -> Weather {
        var weather: Weather
        
        for (key, value) in dictionary {
            
            switch(key) {
            case "temperature":
                weather.temperature.temperature = value as! Double
            default:
                fatalError("Error decoding from JSON!")
            }
            
        return weather
    }
}


}
