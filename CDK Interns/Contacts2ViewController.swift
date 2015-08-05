//
//  Contacts2ViewController.swift
//  CDK Interns
//
//  Created by Kai Tamashiro on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol Contacts2ViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class Contacts2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: Contacts2ViewControllerDelegate?
    var currentVC : UIViewController?
    let dataSourceArray = ["Ariel", "Belle", "Cinderella", "Donald Duck", "Dory", "Figaro", "Genie", "Goofy", "Jasmine", "Jagar", "Lightning McQueen", "Mickey Mouse", "Mike", "Minnie Mouse", "Mulan", "Pocahontas", "Pluto", "Rafiki", "Rapunzel", "Sharkbait", "Snow White",  "Sulley", "Tiana", "WALL-E"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // This was put in mainly for my own unit testing
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
        // Most of the time my data source is an array of something...  will replace with the actual name of the data source
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        cell.textLabel?.text = dataSourceArray[indexPath.row]
        
        // set cell's textLabel.text property 
        // set cell's detailTextLabel.text property
        return cell

    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedContacts = dataSourceArray[indexPath.row]
        
    }
    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let profileVC = segue.destinationViewController as? ProfileViewController{
            currentVC = profileVC
        }
        
    }
    

    
    
    
}



extension Contacts2ViewController{
    func Contacts2itemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    func selectedContacts(item: String){
        
    }
    
    
}
