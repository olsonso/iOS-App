//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

@objc
protocol SidePanelViewControllerDelegate {
    func itemSelected (item : String)
}

class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var delegate: SidePanelViewControllerDelegate?

  var items: [String] = ["Home", "Profile", "Contacts", "Calendar", "Discussion Board", "Settings"]
  
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
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.ItemCell, forIndexPath: indexPath) as! ItemCell
    cell.configureForItem(items[indexPath.row])
    return cell
  }
  
}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let selectedAnimal = items[indexPath.row]
    delegate?.itemSelected(selectedAnimal)
  }
  
}




class ItemCell: UITableViewCell {
  
    @IBOutlet weak var itemNameLabel: UILabel!

    @IBOutlet weak var itemCreatorLabel: UILabel!
    
    func configureForItem(item: String) {
    itemNameLabel.text = item
    itemCreatorLabel.text = ""
  }

  
}