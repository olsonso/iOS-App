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
    let Id: Int
    let ThreadId: Int
    let OrdinalId: Int
    let AuthorId: Int
    let Timestamp: Double
    let Subject: String?
    let Body: String?
    let ImgUrl: String?
    //var geolocation: GeoLocation?
    //var tags: Array<String>
    
    init(id: Int, threadId: Int, ordinalId: Int,
         authorId: Int, timestamp: Double,
         subject: String?, body: String?,
         imgUrl: String?) {
        self.Id = id
        self.ThreadId = threadId
        self.OrdinalId = ordinalId
        self.AuthorId = authorId
        self.Timestamp = timestamp
        self.Subject = subject
        self.Body = body
        self.ImgUrl = imgUrl
    }
    
    class func fromJson(json: JSON)->Message? {
        let id = json["id"].int
        if id == nil {
            return nil
        }
        
        let threadId = json["thread_id"].int
        if threadId == nil {
            return nil
        }
        
        let ordinalId = json["ordinal_id"].int
        if ordinalId == nil {
            return nil
        }
        
        let authorId = json["author_id"].int
        if authorId == nil {
            return nil
        }
        
        let timestamp = json["timestamp"].double
        if timestamp == nil {
            return nil
        }
        
        let subject = json["subject"].string
        
        let body = json["body"].string
        
        let imgUrl = json["img_url"].string
        
        return Message(id:id!, threadId:threadId!,
            ordinalId:ordinalId!, authorId:authorId!, timestamp:timestamp!,
            subject:subject, body:body, imgUrl:imgUrl)
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
