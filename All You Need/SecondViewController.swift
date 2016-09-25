//
//  SecondViewController.swift
//  All You Need
//
//  Created by Shailin Biharie on 04-09-16.
//  Copyright © 2016 Shailin Biharie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Times for the timetable
    var times = ["13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00", "22:00 - 23:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00", "22:00 - 23:00"]
    // Artists for the timetable
    var artists = ["Jonna Fraser", "Murda", "Sevn Alias", "Boef", "Dj Dyna", "SFB", "SBMG", "Ronnie Flex", "Lil Kleine", "Broederliefde", " Benny R", "Sluwe Vos", "Speed J", "Egbert", "Bass Mooy", "SQL", "TWR72", "Joop Junior", "Kamara", "Carl Cox"]
    // Stages for the timetable
    var stages = ["Main Stage", "Main Stage", "Main Stage", "Main Stage", "Main Stage", "Main Stage", "Main Stage", "Main Stage", "Main Stage", "Main Stage",   "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene", "TechnoScene"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Het weergeven van het aantal tableviewcells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // Het inladen van de gegevens voor de tableviewcells
    func tableView(_ tabelView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        // Hightlight op none
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        // Inladen van de tekst
        cell.time.text = times[(indexPath as NSIndexPath).row]
        // Inladen van de artiesten
        cell.artist.text = artists[(indexPath as NSIndexPath).row]
        // Inladen van de stages
        cell.stage.text = stages[(indexPath as NSIndexPath).row]
        // Attribuut voor het schalen van de labels
        [cell.stage.sizeToFit]
        [cell.time.sizeToFit]
        [cell.artist.sizeToFit]
        // De switch standaard op 'false' bij het openen van de app
        cell.customSwitch.isOn = false
        
        return cell
    }

}

