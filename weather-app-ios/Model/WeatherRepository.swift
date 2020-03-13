//
//  WeatherRepository.swift
//  weather-app-ios
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation

class WeatherRepository {
   
    func load(city: String, completion: @escaping (Weather) -> Void){
        ApiDataSource().fetchData(fromCity: city) {weather in
            completion(weather)
        }
        
        //TODO: load last weather from file/database
    }
    
}
