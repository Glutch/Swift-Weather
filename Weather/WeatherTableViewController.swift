//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Oliver Johansson on 2018-03-16.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

import UIKit

let locations = [
    ["location": "Gothenburg", "temp": "2 °C", "wind": "3 m/s"],
    ["location": "London", "temp": "15 °C", "wind": "9 m/s"],
    ["location": "Lindome", "temp": "-5 °C", "wind": "4 m/s"]
]

var locationId = 0

class WeatherTableViewController: UITableViewController {

    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(locations.count)
        self.title = "Locations"
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
