//
//  FirstViewController.swift
//  All You Need
//
//  Created by Shailin Biharie on 04-09-16.
//  Copyright © 2016 Shailin Biharie. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var song1 = 0
    var song2 = 0
    var song3 = 0
    
    var artists = ["Loco Dice", "Loco Dice", "Loco Dice"]
    var songs = ["Sending This One Out",  "Get Comfy", "Party Angels"]
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
        return 3
    }
    
    // Het inladen van de gegevens voor de tableviewcells
    func tableView(_ tabelView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let voteCell = self.tableView.dequeueReusableCell(withIdentifier: "voteCell", for: indexPath) as! VoteCell
        voteCell.voteButton.tag = indexPath.row
        voteCell.voteButton.addTarget(self, action: #selector(postToServerFunction), for: .touchUpInside)

        // Hightlight op none
        voteCell.selectionStyle = UITableViewCellSelectionStyle.none
        
        voteCell.artist.text = artists[(indexPath as NSIndexPath).row]
        voteCell.song.text = songs[(indexPath as NSIndexPath).row]
        // Attribuut voor het schalen van de labels
        voteCell.artist.sizeToFit()
        voteCell.song.sizeToFit()
        
        return voteCell
    }
    
    // Functie voor het verbinden en versturen van de data naar de database
    func postToServerFunction(sender: UIButton) {
        // Check om te kijken welke knop gedrukt is en juiste waarde toevoegen
        let buttonTag = sender.tag
        if (buttonTag == 0) {
            song1 = 1
            song2 = 0
            song3 = 0
        } else if (buttonTag == 1) {
            song1 = 0
            song2 = 1
            song3 = 0
        } else if (buttonTag == 2) {
            song1 = 0
            song2 = 0
            song3 = 1
        }
        
        // Unieke iphone id
        let udid = UIDevice.current.identifierForVendor!.uuidString
        // URL naar de API
        let url: NSURL = NSURL(string: "http://shailinbiharie.nl/API/service.php")!
        // Request naar de server
        let request:NSMutableURLRequest = NSMutableURLRequest(url:url as URL)
        // Data die verstuurt wordt
        let bodyData = "udidiphone=\(udid)&song1=\(song1)&song2=\(song2)&song3=\(song3)"
        // Wat voor soort data
        request.httpMethod = "POST"

        // Check of de verbinding goed is
        request.httpBody = bodyData.data(using: String.Encoding.utf8);
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main)
        {
            (response, data, error) in
            //print(response)
        }
    }
}

