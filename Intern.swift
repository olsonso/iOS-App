//
//  Intern.swift
//  CDK Interns
//
//  Created by Halper, Elizabeth on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

class Intern {
    
    var first_name: String?
    var last_name: String?
    var email: String?
    var pos: String?
    var id: Int!
    
    init(json: JSON) {
        self.first_name = json["first_name"].string
        self.last_name = json["last_name"].string
        self.email = json["email"].string
        self.pos = json["position"].string
        self.id = json["id"].int
    }
}
