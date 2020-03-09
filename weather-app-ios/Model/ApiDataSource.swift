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
    let baseUrl = "api.weatherstack.com/current"
    let apiKey = "5fff8d4066b4c10f6878841e8dab70f9"
    
    //MARK: API request methods
    
    func fetchData() {
        let encoding = Alamofire.JSONEncoding.default
        Alamofire.request(baseUrl, parameters: ["access_key": apiKey, "query": "Blumenau"], encoding: encoding, headers: nil)
            .responseJSON { (response) in
                if response.result.isSuccess {
                    guard let result = response.result.value as? [String: Any] else {
                        return
                    }
                    guard let json = result["current"] as? [String: Any] else {
                        return }
                    
                    let data = WeatherUtils.decodeFromJson(dictionary: json)
                    //TODO: return data
                }
                else{
                    print("There was an error")
                }
        }
    }
}
