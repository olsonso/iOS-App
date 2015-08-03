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
protocol ProfileViewControllerDelegate{
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var mainContainer: UIView!
    
    var delegate: ProfileViewControllerDelegate?
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

extension ProfileViewController{
    func ProfileitemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}
