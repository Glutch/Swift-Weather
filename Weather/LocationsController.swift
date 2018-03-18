//
//  ViewController.swift
//  Weather
//
//  Created by Oliver Johansson on 2018-03-15.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

import UIKit

class LocationsController: UIViewController {

    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = locations[locationId]["location"]
        locationName.text = locations[locationId]["location"]
        temperatureLabel.text = locations[locationId]["temp"]
        windLabel.text = locations[locationId]["wind"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

