//
//  MatchViewController.swift
//  FightClub
//
//  Created by Angel S. Moreno on 1/14/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    
    var match: Match?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let good = GoodPlayer()
        let bad = BadPlayer()
        self.match = Match(firstPlayer: good, secondPlayer: bad)
        player1Name.text = good.name
        player2Name.text = bad.name

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startTheMatch(sender: AnyObject) {
        let winningPlayer = self.match?.playGame()
        if(winningPlayer?.type == "good"){
            performSegueWithIdentifier("GoodWon", sender: nil)
        } else {
            performSegueWithIdentifier("BadWon", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let player = match?.whoWon()
        
        if segue.identifier == "GoodWon" {
            var dest = segue.destinationViewController as GoodWonViewController
            dest.playerName = player?.name
        } else {
            var dest = segue.destinationViewController as BadWonViewController
//            dest.playerName = player?.name
        }
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
