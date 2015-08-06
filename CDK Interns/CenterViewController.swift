//
//  CenterViewController.swift
//  SlideOutNavigation
//
//
//

import Foundation
import UIKit


@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

  
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var tableView: UITableView!

  var delegate: CenterViewControllerDelegate?
    var currentVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println("sections")
        return 1 // This was put in mainly for my own unit testing
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count: \(messages.count)")
        return messages.count
        // Most of the time my data source is an array of something...  will replace with the actual name of the data source
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        //cell.textLabel?.text = "hi"
        //cell.textLabel?.text = dataSourceArray[indexPath.row]
        var message = messages[indexPath.row]
        println(message!.body)
        cell.textLabel?.text = ("\(message!.author_id) \(message!.body)")
        
        // set cell's textLabel.text property
        // set cell's detailTextLabel.text property
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedContacts = messages.values
        
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