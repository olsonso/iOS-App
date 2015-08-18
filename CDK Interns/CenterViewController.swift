//
//  CenterViewController.swift
//  SlideOutNavigation
//
//
//

import Foundation
import UIKit
import Parse


@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: PFQueryTableViewController {
  
    @IBOutlet weak var mainContainer: UIView!


    var delegate: CenterViewControllerDelegate?
    var currentVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override init(style: UITableViewStyle, className: String!){
        super.init(style: style, className: className)
        
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.parseClassName = "Events"
        self.textKey = "Event"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 5
        
    }
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className: self.parseClassName!)
        
        if(objects?.count == 0){
            //   query.cachePolicy = PFCachePolicy.CacheThenNetwork
            println("empty!")
        }
        
        query.orderByAscending("Date")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        
        
        // Extract values from the PFObject to display in the table cell
        if let event = object?["Event"] as? String {
            cell?.textLabel?.text = event
        }
        if let userName = object?["date"] as? String {
            cell?.detailTextLabel?.text = userName
        }
        
        if let date = object?["User"] as? String {
            cell?.detailTextLabel?.text = date
        }
        
        return cell
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

extension CenterViewController{
  func itemSelected (item: String) {
        delegate?.collapseSidePanels?()
  }
    func selectedContacts(item: String){
    }
}