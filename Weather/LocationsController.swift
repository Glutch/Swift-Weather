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
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var armorLabel: UILabel!
    
    var boxAnimator: UIDynamicAnimator!
    var boxGravity: UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temp = locations[locationId]["temp"]
        self.title = locations[locationId]["location"]
        locationName.text = locations[locationId]["location"]
        temperatureLabel.text = "\(locations[locationId]["temp"] ?? "0") °C"
        windLabel.text = locations[locationId]["wind"]
        
        if (Int(temp!)! < -15) {
            armorLabel.text = "Don't go outside."
        } else if (Int(temp!)! < 5) {
            armorLabel.text = "Bring your warmest jacket."
        } else if (Int(temp!)! < 10) {
            armorLabel.text = "Bring a warm jacket."
        } else if (Int(temp!)! < 20) {
            armorLabel.text = "Bring a light summer jacket."
        } else if (Int(temp!)! < 25) {
            armorLabel.text = "A t-shirt should be enough."
        } else if (Int(temp!)! < 30) {
            armorLabel.text = "Go naked or stay inside."
        }
        
        createBoxesForNoReason()
    }
    
    func createBoxesForNoReason() {
        let blackbox = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 10))
        let bluebox = UIView(frame: CGRect(x: UIScreen.main.bounds.width - 20, y: 0, width: 10, height: 10))
        blackbox.backgroundColor = UIColor.black
        bluebox.backgroundColor = UIColor.blue
        view.addSubview(blackbox)
        view.addSubview(bluebox)
        
        boxAnimator = UIDynamicAnimator(referenceView: view)
        boxGravity = UIGravityBehavior(items: [blackbox, bluebox])
        boxAnimator.addBehavior(boxGravity)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

