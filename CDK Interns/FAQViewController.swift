//
//  FAQViewController.swift
//  CDK Interns
//
//  Created by Kai Tamashiro on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol FAQViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class FAQViewController: UIViewController {
    
    @IBOutlet weak var mainContainer: UIView!
    
    var delegate: FAQViewControllerDelegate?
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

extension FAQViewController{
    func FAQitemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}
