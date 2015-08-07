//
//  FAQViewController.swift
//  CDK Interns
//
//  Created by Kai Tamashiro on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol FAQViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class FAQViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mainContainer: UIView!
   /*
    var FAQs : Array<FAQ>!
    
    struct TableView {
        struct CellIdentifies{
            static let FAQcells = "FAQcells"
        }
    }
    
    */
    
    var delegate: FAQViewControllerDelegate?
    var currentVC : UIViewController?
    
   // let faqcells = ["You use the Etime portal through ADP online or on thier mobile application"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    /*
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // This was put in mainly for my own unit testing
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqcells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FAQCell") as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = faqcells[row]
        return cell
    }
*/
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

extension FAQViewController{
    func FAQitemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}
