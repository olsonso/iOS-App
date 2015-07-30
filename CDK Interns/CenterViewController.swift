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

        if let profileVC = segue.destinationViewController as? ProfileViewController{
       currentVC = profileVC
       }
        
        if let contactVC = segue.destinationViewController as? ContactsViewController{
        currentVC = contactVC
        }
    }



}

extension CenterViewController{
  func itemSelected (item: String) {
        delegate?.collapseSidePanels?()
  }

}