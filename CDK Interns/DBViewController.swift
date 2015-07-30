//
//  DBViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol DBViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class DBViewController: UIViewController{
    
    var leftViewController: SidePanelViewController?
    
    
    
    @IBAction func navBarTapped(sender: AnyObject) {
        
    }
    
}