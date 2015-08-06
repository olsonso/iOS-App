//
//  AppModel.swift
//  CDK Interns
//
//  Created by Halper, Elizabeth on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation

class AppModel: NSObject, Printable {
    let first_name: String
    let last_name: String
    
    override var description: String {
        return "First Name: \(first_name), Last Name: \(last_name)\n"
    }
    
    init(name: String?, appStoreURL: String?) {
        self.first_name = name ?? ""
        self.last_name = appStoreURL ?? ""
    }
}