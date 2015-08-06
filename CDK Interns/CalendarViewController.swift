//
//  CalendarViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol CalendarViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class CalendarViewController: UIViewController {
    
    @IBOutlet weak var mainContainer: UIView!
    
    var delegate: CalendarViewControllerDelegate?
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

extension CalendarViewController{
    func CalendaritemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}
