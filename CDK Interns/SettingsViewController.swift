//
//  SettingsViewController.swift
//  CDK Interns
//
//  Created by Kai Tamashiro on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol SettingsViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class SettingsViewController: UIViewController {

    
    @IBOutlet var primemailEntry: UITextField!
    @IBOutlet var altemailEntry: UITextField!
    
    @IBOutlet var newpassEntry: UITextField!
    @IBOutlet var confirmnpassEntry: UITextField!
    
    @IBOutlet var mobilephoneEntry: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    
// Slide menu stuff:
    
    @IBOutlet weak var mainContainer: UIView!
    
    var delegate: SettingsViewControllerDelegate?
    var currentVC : UIViewController?
    
    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let profileVC = segue.destinationViewController as? ProfileViewController{
            currentVC = profileVC
        }
       
    }
    
    
    
}

extension SettingsViewController{
    func SettingsitemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}