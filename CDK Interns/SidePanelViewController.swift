//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import Parse


protocol SidePanelViewControllerDelegate {
    func itemSelected(item: MenuItem)
}

enum MenuItem: Int {
    case Home
    case Profile
    case Calendar
    case Discussion
    case Contacts
    case FAQ
    case Settings
    case Logout
    
    func viewController() -> UIViewController {
        switch (self) {
        case Home:
            return UIStoryboard.centerViewController()!
        case Profile: return UIStoryboard.profileViewController()!
        case Calendar: return UIStoryboard.calendarViewController()!
       // case Discussion: return UIStoryboard.discussionViewController()!
        case Contacts: return UIStoryboard.contacts2ViewController()!
        case FAQ: return UIStoryboard.faqViewController()!
        case Settings: return UIStoryboard.settingsViewController()!
        case Logout: logout()
            return UIStoryboard.loginViewController()!
    
        default: return UIStoryboard.centerViewController()!
        }
    }
}

func logout(){
    PFUser.logOut()
    
}


class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var delegate: SidePanelViewControllerDelegate?

    var items: [String] = ["Home", "Profile", "Calendar", "Discussion", "Contacts", "FAQ", "Settings", "Logout"]
  
  struct TableView {
    struct CellIdentifiers {
      static let ItemCell = "ItemCell"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.reloadData()
  }
  
}

// MARK: Table View Data Source

extension SidePanelViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
    /*
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
*/
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.ItemCell, forIndexPath: indexPath) as! ItemCell
    cell.configureForItem(items[indexPath.row])
    return cell
  }
  
}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let selectedItem = items[indexPath.row]
    delegate?.itemSelected(MenuItem(rawValue: indexPath.row)!)
  }
  
}



class ItemCell: UITableViewCell {
  
    @IBOutlet weak var itemNameLabel: UILabel!

    func configureForItem(item: String) {
    itemNameLabel.text = item
   
  }

  
}