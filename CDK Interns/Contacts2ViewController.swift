//
//  Contacts2ViewController.swift
//  CDK Interns
//
//  Created by Kai Tamashiro on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit
import Parse

@objc
protocol Contacts2ViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class Contacts2ViewController: PFQueryTableViewController{
    
  
    
    var delegate: Contacts2ViewControllerDelegate?
    var currentVC : UIViewController?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override init(style: UITableViewStyle, className: String!){
        super.init(style: style, className: className)
    
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.parseClassName = "Contacts"
        self.textKey = "Name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 15
        
    }
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className: self.parseClassName!)
        
        if(objects?.count == 0){
         //   query.cachePolicy = PFCachePolicy.CacheThenNetwork
            println("empty!")
        }
        
        query.orderByAscending("name")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let nameEnglish = object?["Name"] as? String {
            cell?.textLabel?.text = nameEnglish
        }
        if let capital = object?["School"] as? String {
            cell?.detailTextLabel?.text = capital
        }
        if let date = object?["date"] as? String {
            cell?.detailTextLabel?.text = date
        }
        return cell
    }
    

    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as! DetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = (objects?[row] as! PFObject)
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
