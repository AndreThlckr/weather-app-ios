//
//  WeatherTableViewController.swift
//  weather-app-ios
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    var forecastsViewModel = ForecastsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastsViewModel.loadWeathers(fromCities: ["Blumenau", "Florianópolis", "São Paulo"]) { () in
            print("Reloading data!")
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Returned number of rows in section: \(forecastsViewModel.numberOfWeathers)")
        return forecastsViewModel.numberOfWeathers
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell else {
            fatalError("Unexpected cell in table!")
        }
        
        let index = indexPath.row
        
        forecastsViewModel.loadIcon(withId: index) { image in
            cell.iconImageView.image = image
        }
        
        cell.cityLabel.text = forecastsViewModel.city(withId: index)

        cell.descriptionLabel.text = forecastsViewModel.description(withId: index)
        
        cell.temperatureLabel.text = forecastsViewModel.temperature(withId: index)

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "ShowWeatherDetails":
            guard let viewController = segue.destination as? WeatherViewController else {
                fatalError("Unexpected destination!")
            }
            
            guard let selectedCell = sender as? WeatherTableViewCell else {
                fatalError("Unexpected sender!")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed on the table!")
            }
            
            let selectedWeather = forecastsViewModel.weather(withId: indexPath.row)
            
            viewController.weatherViewModel = WeatherViewModel(weather: selectedWeather)
            
        default:
            fatalError("Unexpected segue identifier: \(segue.identifier!)")
        }
    }
 

}
