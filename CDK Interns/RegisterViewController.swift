//
//  RegisterViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 8/10/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import Parse
import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cdklogo: UIImageView!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userUsername: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var createAccount: UIButton!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var customImage: PFImageView!
    var query = PFQuery(className: "User")
 
    var imageData = PFObject(className: "photo")
    
    
    func presentHomePage() {
        //create function to log in
        presentViewController(ContainerViewController(), animated: true, completion: nil)
    }
    
    @IBAction func addImageTapped(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        imageView.contentMode = .ScaleAspectFit
        imageView.image = pickedImage
        
        let imageData1 = UIImageJPEGRepresentation(pickedImage, 0.8)
        let imageFile = PFFile(data: imageData1)
        imageFile.save()
     }
    
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccount(sender: AnyObject) {
        let UserEmail = userEmail.text
        let UserUsername = userUsername.text
        let UserPassword = userPassword.text
        
        if (userPassword.text.isEmpty || userUsername.text.isEmpty){
            var displayAlert = UIAlertView(title: "Error", message: "Please enter valid username and password", delegate: self, cancelButtonTitle: "Okay")
            displayAlert.show()
            return
        }
        
        ///store data
        let myUser: PFUser = PFUser();
        myUser.username = UserUsername
        myUser.password = UserPassword
        myUser.email = UserEmail
        //myUser.photo = imageData
        
        myUser.signUpInBackgroundWithBlock{ (succeeded, error)-> Void in
                println("User registered, \(error)")
            var displayLogin = UIAlertView(title: "Success ", message: "You have sucessfully made an account!", delegate: self, cancelButtonTitle: "Okay")
            displayLogin.show()
        
        }
            self.presentHomePage()


    }
    
    
    

}

