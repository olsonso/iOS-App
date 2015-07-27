//
//  CenterViewController.swift
//  SlideOutNavigation
//
//
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