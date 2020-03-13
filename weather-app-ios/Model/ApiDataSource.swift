//
//  ApiDataSource.swift
//  weather-app-ios
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation
import Alamofire

class ApiDataSource {
    
    //MARK: Properties
    
    let baseUrl = "http://api.openweathermap.org/data/2.5/weather"
    
    private let apiKey = "1b6691af33b72ea1d9f3494cc2665fe9"
    
    
    //MARK: API request methods
    
    func fetchData(fromCity: String, completion: @escaping (Weather) -> Void) {
         let url = "\(baseUrl)?q=\(fromCity.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)&APPID=\(apiKey)&units=metric"
        Alamofire.request(url)
            .responseJSON { (response) in
                print(response)
                
                if response.result.isSuccess {
                    let result = response.data!
                    
                    let weather = try! JSONDecoder().decode(Weather.self, from: result)
                    
                    completion(weather)
                }
                else{
                    print("There was an error: \(response.error)")
                }
        }
    }
}
