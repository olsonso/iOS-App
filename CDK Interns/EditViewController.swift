//
//  EditViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 7/27/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var collegeTextfield: UITextField!
    @IBOutlet weak var funfactTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        // load user current info and picture
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @IBAction func chooseProfileButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
