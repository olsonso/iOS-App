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

extension CenterViewController: SidePanelViewControllerDelegate {
  func itemSelected (item: String) {
    //var currentVC : UIViewController?
    //string = "contact"
    
    
    
    if item == "Contacts"{
    let currentVC : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("ContactsViewController")
    self.showViewController(currentVC as! UIViewController, sender: currentVC)
    }
  /*
    else{
        let currentVC : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("ProfileViewController")
        self.showViewController(currentVC as! UIViewController, sender: currentVC)
    }
    */
    /*
if let profileVC = currentVC as? ProfileViewController {
       println("Entered Profile")
    }
    
    if let contactVC = currentVC as? ContactsViewController{
        println("Entered Contact")
    
    }
R
    let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContactsViewController") as? ContactsViewController
      self.presentViewController(secondViewController!, animated: true, completion: nil)
    
    //self.navigationController!.pushViewController(secondViewController!, animated: true)

    */
    delegate?.collapseSidePanels?()
  }

}