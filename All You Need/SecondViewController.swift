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
    var times:[Int:String] = [0:"13:00 - 14:00", 1:"14:00 - 15:00", 2:"15:00 - 16:00", 3:"16:00 - 17:00", 4:"17:00 - 18:00", 5:"18:00 - 19:00", 6:"19:00 - 20:00", 7:"20:00 - 21:00", 8:"21:00 - 22:00", 9:"22:00 - 23:00", 10:"13:00 - 14:00", 11:"14:00 - 15:00", 12:"15:00 - 16:00", 13:"16:00 - 17:00", 14:"17:00 - 18:00", 15:"18:00 - 19:00", 16:"19:00 - 20:00", 17:"20:00 - 21:00", 18:"21:00 - 22:00", 19:"22:00 - 23:00"]
    // Artists for the timetable
    var artists:[Int:String] = [0:"Jonna Fraser", 1:"Murda", 2:"Sevn Alias", 3:"Boef", 4:"Dj Dyna", 5:"SFB", 6:"SBMG", 7:"Ronnie Flex", 8:"Lil Kleine", 9:"Broederliefde", 10:"Benny R", 11:"Sluwe Vos", 12:"Speed J", 13:"Egbert", 14:"Bass Mooy", 15:"SQL", 16:"TWR72", 17:"Joop Junior", 18:"Loco Dice", 19:"Carl Cox"]
    // Stages for the timetable
    var stages:[Int:String] = [0:"Main Area", 1:"Main Area", 2:"Main Area", 3:"Main Area", 4:"Main Area", 5:"Main Area", 6:"Main ARea", 7:"Main Area", 8:"Main Area", 9:"Main Area",   10:"TechnoScene", 11:"TechnoScene", 12:"TechnoScene", 13:"TechnoScene", 14:"TechnoScene", 15:"TechnoScene", 16:"TechnoScene", 17:"TechnoScene", 18:"TechnoScene", 19:"TechnoScene"]
    // Maanden
    var months:[Int:String] = [1:"januari", 2:"februari", 3:"maart", 4:"april", 5:"mei", 6:"juni", 7:"juli", 8:"augustus", 9:"september", 10:"oktober", 11:"november", 12:"december"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        // Alle rijen een waarde geven
        cell.customSwitch.tag = indexPath.row
        cell.customSwitch.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)

        // Hightlight op none
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        // Inladen van de tekst
        cell.time.text = times[(indexPath as NSIndexPath).row]
        // Inladen van de artiesten
        cell.artist.text = artists[(indexPath as NSIndexPath).row]
        // Inladen van de stages
        cell.stage.text = stages[(indexPath as NSIndexPath).row]
        // Attribuut voor het schalen van de labels
        cell.stage.sizeToFit()
        cell.time.sizeToFit()
        cell.artist.sizeToFit()
        // De switch standaard op 'false' bij het openen van de app
        cell.customSwitch.isOn = false
        
        return cell
    }
    
    func notificationButtonTapped(sender: AnyObject) {
        // Switch waarde ophalen
        let switchTag = sender.tag
        //Het aanmaken van een kalender instantie:
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
        //Aan de kalender instatie de dag vragen:
        let currentDayInt = (calendar?.component(NSCalendar.Unit.day, from: NSDate() as Date))!
        //Aan de kalender instatie de maand vragen:
        let currentMonthInt = (calendar?.component(NSCalendar.Unit.month, from: NSDate() as Date))!
        //Aan de kalender instatie het jaar vragen:
        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: NSDate() as Date))!
        // Het opbouwen van de notificatie voor de Apple Watch en iPhone
        let localNotification = UILocalNotification()
        // Vertraging op de notificatie zetten
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5) as Date
        localNotification.alertTitle = artists[switchTag!]
        localNotification.alertBody = "begint om " + times[switchTag!]! + ". \(currentDayInt) \(months[currentMonthInt]!) \(currentYearInt). Locatie: " + stages[switchTag!]! + ", Latin Village."
        localNotification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }

}

