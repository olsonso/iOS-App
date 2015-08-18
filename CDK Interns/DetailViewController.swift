//
//  DetailViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 8/12/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import Parse
import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userLocation: UITextField!
    @IBOutlet weak var userPostion: UITextField!
    
    var currentObject : PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let object = currentObject{
            userName.text = object["Name"] as! String
            userEmail.text = object ["Email"] as! String
            userLocation.text = object ["School"] as! String
            userPostion.text = object["Postion"] as! String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}