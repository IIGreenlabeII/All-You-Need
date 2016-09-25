//
//  VoteCell.swift
//  All You Need
//
//  Created by Shailin Biharie on 11-09-16.
//  Copyright © 2016 Shailin Biharie. All rights reserved.
//

import UIKit

class VoteCell: UITableViewCell {

    @IBOutlet var artist: UILabel!
    @IBOutlet var song: UILabel!
    @IBOutlet var voteButton: UIButton!
    
    // Functie voor het verbinden en versturen van de data naar de database
    func postToServerFunction() {
        // Unieke iphone id
        let udid = UIDevice.current.identifierForVendor!.uuidString
        // URL naar de API
        let url: NSURL = NSURL(string: "http://shailinbiharie.nl/API/service.php")!
        // Request naar de server
        let request:NSMutableURLRequest = NSMutableURLRequest(url:url as URL)
        // Data die verstuurt wordt
        let bodyData = "udidiphone=\(udid)"
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
    
    // Functie voor het aanspreken van de functie
    @IBAction func postToServerButton(_ sender: UIButton) {
        postToServerFunction()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
