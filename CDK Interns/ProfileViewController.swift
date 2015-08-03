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

