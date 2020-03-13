//
//  WeatherArrayViewModel.swift
//  weather-app-ios
//
//  Created by Jonathan on 11/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class ForecastsViewModel {
    let weatherRepository = WeatherRepository()
    
    var weathers = [Weather]()
    
    func loadWeathers(fromCities: [String], completion: @escaping () -> ()) {
        for city in fromCities {
            weatherRepository.load(city: city) { weather in
                self.weathers.append(weather)
                
                if(self.weathers.count == fromCities.count) {
                    debugPrint("Should've loaded correctly")
                    completion()
                }
            }
        }
    }
    
    var numberOfWeathers : Int {
        get { return weathers.count }
    }
    
    func weather(withId: Int) -> Weather {
            return weathers[withId]
    }
    
    func city(withId: Int) -> String {
        return weathers[withId].city
    }
    
    func loadIcon(withId: Int, completion: @escaping (Image) -> ()) {
        let imageLoader = ImageLoader()
        
        imageLoader.loadImage(fromUrl: iconUrl(withId: withId)) { icon in
            completion(icon)
        }
    }
    
    private func iconUrl(withId: Int) -> URL {
        return weathers[withId].weatherPredictions[0].iconUrl
    }
    
    func description(withId: Int) -> String {
        let todayPrediction = weathers[0].weatherPredictions[0]
        return todayPrediction.description
    }
    
    func temperature(withId: Int) -> String {
        return "\(weathers[withId].temperature.current)°"
    }
}
