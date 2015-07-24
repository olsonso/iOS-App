//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
  optional func toggleLeftPanel()
  optional func toggleRightPanel()
  optional func collapseSidePanels()
}

class CenterViewController: UIViewController {

  
    @IBOutlet weak var mainContainer: UIView!

    var delegate: CenterViewControllerDelegate?
    var currentVC : UIViewController?

  
  // MARK: Button actions
  
  @IBAction func kittiesTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
  }
  
  @IBAction func puppiesTapped(sender: AnyObject) {
    delegate?.toggleRightPanel?()
  }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let profileVC = segue.destinationViewController as? ProfileViewController
        currentVC = profileVC
    }

}

extension CenterViewController: SidePanelViewControllerDelegate {
  func itemSelected (item: String) {

    if let profileVC = currentVC as? ProfileViewController {
        profileVC.label.text = item
    }
    
    delegate?.collapseSidePanels?()
  }

}