//
//  FAQ.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 8/6/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
@objc
class FAQ {
    
   
    let title: String
    let message: String
    
    init(title:String, message:String){
        self.title = title
        self.message = message
    }


class func allFAQ() -> Array<FAQ>{
    return[ FAQ(title: "How Do I Clock In?", message: "you clock in by using the ADP portal, which has an online website or mobile app")]
}
}