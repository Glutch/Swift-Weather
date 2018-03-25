//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Oliver Johansson on 2018-03-16.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

import UIKit

var locations = [
    ["location": "Gothenburg", "temp": "2 °C", "wind": "3 m/s"]
]

var locationId = 0

struct APILocation: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Int
    let pressure: Int
    let humidity: Int
}

class WeatherTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var locationsTableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(locations.count)
        self.title = "Locations"
        
        search.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let location = searchBar.text, !location.isEmpty {
            updateWeather(location: location)
        }
    }
    
    func updateWeather (location: String) {
        guard let weatherApi = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(location)&units=metric&APPID=d659190d89ad48a42b479200eacaf33d") else { return }
        
        URLSession.shared.dataTask(with: weatherApi) { (data, res, err) in
            
            guard let data = data else { return }
            
            guard let res = try? JSONDecoder().decode(APILocation.self, from: data) else {
                print("Error: Couldn't decode data")
                return
            }
            print(res)
            locations.append(["location": res.name, "temp": "\(res.main.temp) °C", "wind": "\(res.main.humidity)"])
            DispatchQueue.main.async{
                self.locationsTableView.reloadData()
            }
        }.resume()
        print(location)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = locations[indexPath.item]["location"]
        cell.detailTextLabel?.text =
            "Temperature: \(locations[indexPath.item]["temp"]!), Wind speed: \(locations[indexPath.item]["wind"]!)"

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        locationId = indexPath.row
        performSegue(withIdentifier: "viewLocationSegue", sender: self)
    }
}
