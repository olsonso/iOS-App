//
//  Message.swift
//  CDK Interns
//
//  Created by Halper, Elizabeth on 8/5/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit

class Message {
    
    var id: Int!
    var author_id: Int!
    var subject: String?
    var body: String?
    var timestamp: String?
    var geolocation: String?
    var img: String?
    var tags: Array<String>?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.author_id = json["author_id"].int
        self.subject = json["subject"].string
        self.body = json["body"].string
        self.timestamp = json["timestamp"].string
        self.geolocation = json["geolocation"].string
        self.img = json["img"].string
        //self.tags = json["tags"].array
    }
}

/*"id" : 0,
"author_id" : 0,
"subject" : "Check Out Pick!",
"body" : "You should check out this new database called Pick!  It’s rad!",
"timestamp" : "2015-08-04T16:56:52+00:00",
"geolocation" : "Portland, OR",
"image" :
"tags" : ["random"]*/
