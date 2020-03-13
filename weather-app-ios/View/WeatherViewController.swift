//
//  WeatherViewController.swift
//  weather-app-ios
//
//  Created by Jonathan on 13/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegreeLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard weatherViewModel != nil else {
            fatalError("Didn't receive a WeatherViewModel!")
        }
        
        cityLabel.text = weatherViewModel?.city
        minTemperatureLabel.text = weatherViewModel?.minTemperature
        maxTemperatureLabel.text = weatherViewModel?.maxTemperature
        humidityLabel.text = weatherViewModel?.humidity
        windSpeedLabel.text = weatherViewModel?.windSpeed
        windDegreeLabel.text = weatherViewModel?.windDegree
        feelsLikeLabel.text = weatherViewModel?.feelsLike
    }
    

}
