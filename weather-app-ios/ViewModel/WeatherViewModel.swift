//
//  WeatherViewModel.swift
//  weather-app-ios
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation

class WeatherViewModel {
    var weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    var city: String {
        get { return weather.city }
    }
    
    var minTemperature: String {
        get {
            let temp = weather.temperature.minTemperature
            return "\(temp)°C"
        }
    }
    
    var maxTemperature: String {
        get {
            let temp = weather.temperature.maxTemperature
            return "\(temp)°C"
        }
    }
    
    var humidity: String {
        get {
            return "\(weather.temperature.humidity)%"
        }
    }
    
    var windSpeed: String {
        get {
            return "\(weather.wind.speed) km/h"
        }
    }
    
    var windDegree: String {
        get {
            return "\(weather.wind.degree)°"
        }
    }
    
    var feelsLike: String {
        get {
            let temp = weather.temperature.feelsLike
            return "\(temp)°C"
        }
    }
}
