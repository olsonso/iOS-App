//
//  ContactsTableViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 8/11/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import UIKit
import Parse

class ContactsTableViewController: PFQueryTableViewController {
   
    
    override init(style: UITableViewStyle, className: String!){
        super.init(style: style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 15
        
        self.parseClassName = className
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("NSCoding Not supported!")
    }
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className: self.parseClassName!)
        
        if(objects?.count == 0){
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        
        query.orderByAscending("name")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        let cellIdentifier:String = "Cell"
        
        var cell:PFTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        
        if(cell == nil) {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        if let pfObject = object {
            cell?.textLabel?.text = pfObject["name"] as? String
        }
        
        return cell
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
