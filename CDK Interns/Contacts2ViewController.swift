//
//  Contacts2ViewController.swift
//  CDK Interns
//
//  Created by Kai Tamashiro on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol Contacts2ViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class Contacts2ViewController: UIViewController {
    
    @IBOutlet weak var mainContainer: UIView!
    
    var delegate: Contacts2ViewControllerDelegate?
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

extension Contacts2ViewController{
    func Contacts2itemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}
