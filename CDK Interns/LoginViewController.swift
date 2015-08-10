//
//  LoginViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 7/24/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit
import Parse


class LoginViewController : UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginInitialLabel: UILabel!
    
    var loginViewController: LoginViewController!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    addSubview(LoginViewController)
        
}
    @IBAction func loginTouch(sender: AnyObject) {
        
        if Username.text != "" && Password.text != "" {
            // Not Empty, Do something.
        } else {
            // Empty, Notify user
            self.loginInitialLabel.text = "All Fields Required"
        }
        
        PFUser.logInWithUsernameInBackground(Username.text, password:Password.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Yes, User Exists
                self.loginInitialLabel.text = "User Exists"
            } else {
                // No, User Doesn't Exist
            }
        }
        
        let containerViewController = ContainerViewController()
        presentViewController(containerViewController, animated: true, completion: nil)
    }
}