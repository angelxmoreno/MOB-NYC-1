//
//  GoodWonViewController.swift
//  FightClub
//
//  Created by Angel S. Moreno on 1/14/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class GoodWonViewController: UIViewController {
    
    var playerName: String?
    
    @IBOutlet weak var playerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerLabel.text = playerName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
