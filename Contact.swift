//
//  Intern.swift
//  CDK Interns
//
//  Created by Halper, Elizabeth on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    let Id: Int
    let FirstName: String
    let LastName: String
    let Email: String
    let Position: String
    
    init(id: Int, firstName: String, lastName: String, email: String, position: String) {
        self.Id = id
        self.FirstName = firstName
        self.LastName = lastName
        self.Email = email
        self.Position = position
    }
    
    class func fromJson(json: JSON) -> Contact? {
        let id = json["id"].int
        if id == nil {
            return nil
        }
        
        let firstName = json["first_name"].string
        if firstName == nil {
            return nil
        }
        
        let lastName = json["last_name"].string
        if lastName == nil {
            return nil
        }
        
        let email = json["email"].string
        if email == nil {
            return nil
        }
        
        let position = json["position"].string
        if position == nil {
            return nil
        }
        
        return Contact(id:id!, firstName:firstName!, lastName:lastName!, email:email!, position:position!)
    }
}
