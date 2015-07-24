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

  var items: [String] = ["Item1", "Item2"]
  
  struct TableView {
    struct CellIdentifiers {
      static let AnimalCell = "AnimalCell"
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
    let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.AnimalCell, forIndexPath: indexPath) as! AnimalCell
    cell.configureForAnimal(items[indexPath.row])
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

class AnimalCell: UITableViewCell {
  
  @IBOutlet weak var animalImageView: UIImageView!
  @IBOutlet weak var imageNameLabel: UILabel!
  @IBOutlet weak var imageCreatorLabel: UILabel!
  
  func configureForAnimal(item: String) {
    animalImageView.image = nil
    imageNameLabel.text = item
    imageCreatorLabel.text = ""
  }
  
}