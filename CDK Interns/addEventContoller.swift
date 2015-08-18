//
//  addEventContoller.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 8/17/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import Parse

class addEventContoller: UIViewController{
    
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var event: UITextField!
   
    @IBOutlet weak var saveButton: UIButton!
    
    var currentObject : PFObject?
    
    var addEventView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

  
    @IBAction func saveButton(sender: AnyObject) {
        var newPost = PFObject(className: "Events")
        
        if event.text.isEmpty != true{
            newPost["Event"] = event.text
            newPost["date"] = date.text
            newPost.saveInBackground()
        }
        else{
            var alert = UIAlertView(title: "Error", message: "Error", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
            
        }
        
       
    }
    
        
   
    
    
}

    
