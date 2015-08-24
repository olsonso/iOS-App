//
//  calendarRepository.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 8/20/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

class Repository{
    var name: String?
    var description: String?
    
    init(json: NSDictionary){
        self.name = json["city"] as! String?
        self.description = json["country"] as! String?
        
    }
}