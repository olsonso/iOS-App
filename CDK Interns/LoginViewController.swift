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
    var activity: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    var loginViewController: LoginViewController!
    
    
    func presentHomePage() {
        //create function to log in
        presentViewController(ContainerViewController(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activity.center = self.view.center
        self.activity.hidesWhenStopped = true
        self.activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.activity)
    }
    
    
    @IBAction func loginTouch(sender: AnyObject) {
        let userName = self.Username.text
        let userPassword = self.Password.text
    
        
        if (((count(userName.utf16) < 4 ) || (count(userPassword.utf16)) < 5)){
            var alert = UIAlertView(title: "Invalid", message: "Username must be 4 characters long", delegate: self, cancelButtonTitle: "Okay")
            alert.show()
        }
            else{
                self.activity.startAnimating()
            }
      
        var username = self.Username.text
        var password = self.Password.text
        
        if Username.text != "" && Password.text != "" {
            // Not Empty, Do something.

        } else {
            // Empty, Notify user
             var displayAlert = UIAlertController(title: "Alert", message: "All Fields are Required!", preferredStyle: UIAlertControllerStyle.Alert)
        
        }
        
       
        PFUser.logInWithUsernameInBackground(userName, password:password) {
            (user, error) -> Void in
            
            self.activity.stopAnimating()
            
            if (user != nil ){
                // Yes, User Exists
               var alert = UIAlertView(title: "Success!", message: "You have logged In", delegate: self, cancelButtonTitle: "Okay")
                alert.show()
                self.presentHomePage()
                //self.dismissViewControllerAnimated(true, completion: nil)
               // presentViewController(ContainerViewController(), animated: true, completion: nil)
                
                
            } else {
                // No, User Doesn't Exist
                 var displayAlert = UIAlertView(title: "Alert", message: "\(error)", delegate: self, cancelButtonTitle: "Okay")
                    displayAlert.show()
                
            }
        }
        
    }
    


    }