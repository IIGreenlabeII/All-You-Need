//
//  SecondViewController.swift
//  All You Need
//
//  Created by Shailin Biharie on 04-09-16.
//  Copyright © 2016 Shailin Biharie. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var stageLabel: UILabel!
    let userDefaults = UserDefaults.standard;
    
    // Voor het verwijderen van de laatst aangegeven favoriete artiest
    override func viewDidLoad() {
        // Verwijderen van de laatste artiest
        userDefaults.removeObject(forKey: "time")
        userDefaults.removeObject(forKey: "artistName")
        userDefaults.removeObject(forKey: "stageName")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Voor het bijwerken van de favoriete artiest van de gebruiker
    override func viewDidAppear(_ animated: Bool) {
        // De juiste label invullen
        timeLabel.text = userDefaults.object(forKey: "time") as? String
        artistLabel.text = userDefaults.object(forKey: "artistName") as? String
        stageLabel.text = userDefaults.object(forKey: "stageName") as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
