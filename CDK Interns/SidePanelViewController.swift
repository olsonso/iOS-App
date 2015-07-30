//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit


protocol SidePanelViewControllerDelegate {
   // func itemSelected (item : String)
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
    
    func viewController() -> UIViewController {
        switch (self) {
        case Home: return UIStoryboard.centerViewController()!
        case Profile: return {
            //let vc = UIViewController();
            let vc = ContactsViewController()
            vc.view.backgroundColor = UIColor.redColor();
            return vc
            }()
        case Calendar: return UIStoryboard.calendarViewController()!
        case Discussion: return UIStoryboard.discussionViewController()!
        case Contacts: return {
            let vc = UIViewController();
            vc.view.backgroundColor = UIColor.greenColor();
            return vc
            }()
        case FAQ: return {
            let vc = UIViewController();
            vc.view.backgroundColor = UIColor.blueColor();
            return vc
            }()
        case Settings: return {
            let vc = UIViewController();
            vc.view.backgroundColor = UIColor.purpleColor();
            return vc
            }()
        }
    }
}


class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var delegate: SidePanelViewControllerDelegate?

  var items: [String] = ["Home", "Profile", "Calendar", "Discussion", "Contacts", "FAQ", "Settings"]
  
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
        return 7
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