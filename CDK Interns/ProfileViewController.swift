//
//  ProfileViewController.swift
//  CDK Interns
//
//  Created by Strull, Brian on 7/15/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol ProfileViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class ProfileViewController : UIViewController {
    var delegate: ProfileViewControllerDelegate?

    @IBOutlet weak var label: UILabel!
    
}

extension ProfileViewController: SidePanelViewControllerDelegate {
    func itemSelected (item: String) {
        //var currentVC : UIViewController?
        //string = "contact"
        
        
        
        if item == "Contacts"{
            let currentVC : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("ContactsViewController")
            self.showViewController(currentVC as! UIViewController, sender: currentVC)
        }
            
        else{
            let currentVC : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("ProfileViewController")
            self.showViewController(currentVC as! UIViewController, sender: currentVC)
        }
        
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
    //    delegate?.collapseSidePanels?()
    }
}