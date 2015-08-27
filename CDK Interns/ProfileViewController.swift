//
//  ProfileViewController.swift
//  CDK Interns
//
//  Created by Strull, Brian on 7/15/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit
import Parse

@objc
protocol ProfileViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class ProfileViewController : UIViewController {
    var delegate: ProfileViewControllerDelegate?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userPostion: UITextField!
    @IBOutlet weak var userNumber: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userLocation: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    var currentObject = PFObject(className: "User")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
            ///parse information about user logged in
            userName.text = currentObject["username"] as! String
            userEmail.text = currentObject ["email"] as! String
           // userLocation.text = currentObject [""] as! String
            //userPostion.text = currentObject["Postion"] as! String

      
        }
        
    }
    
    
    


