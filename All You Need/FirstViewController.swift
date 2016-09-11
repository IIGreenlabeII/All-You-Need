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
    
    var artists = ["Broederliefde", "Broederliefde", "Broederliefde"]
    var songs = ["Jungle",  "Mi No Lob", "Ik Was Al Binnen"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Het weergeven van het aantal tableviewcells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // Het inladen van de gegevens voor de tableviewcells
    func tableView(tabelView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let voteCell = self.tableView.dequeueReusableCellWithIdentifier("voteCell", forIndexPath: indexPath) as! VoteCell
        
        // Hightlight op none
        voteCell.selectionStyle = UITableViewCellSelectionStyle.None
        
        voteCell.artist.text = artists[indexPath.row]
        voteCell.song.text = songs[indexPath.row]
        // Attribuut voor het schalen van de labels
        [voteCell.artist.sizeToFit]
        [voteCell.song.sizeToFit]
        
        return voteCell
    }
    
}

