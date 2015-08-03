//
//  LoginViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 7/24/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit


class LoginViewController : UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var loginViewController: LoginViewController!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    addSubview(LoginViewController)
        
}
    @IBAction func loginTouch(sender: AnyObject) {
        
        
        let containerViewController = ContainerViewController()
        presentViewController(containerViewController, animated: true, completion: nil)
    }
}