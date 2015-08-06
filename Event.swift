//
//  Event.swift
//  CDK Interns
//
//  Created by New, Daniel on 8/5/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation

class Event {
    enum ActionType {
        case Create
        case Update
        case Delete
    }
    enum ContentType {
        case Contact
        case Message
    }
    
    let Timestamp: Double
    let Action: ActionType
    let Type: ContentType
    let Content: AnyObject
    
    init(timestamp:Double, action:ActionType, type:ContentType, content:AnyObject) {
        self.Timestamp=timestamp
        self.Action = action
        self.Type = type
        self.Content = content
    }
    
    class func fromJson(json: JSON)->Event? {
        let timestamp = json["timestamp"].double
        if timestamp == nil {
            return nil
        }
        
        var action : ActionType
        let actionStr = json["action"].string
        if actionStr == nil {
            return nil
        }
        switch actionStr! {
            case "create":
                action = ActionType.Create
            case "update":
                action = ActionType.Update
            case "delete":
                action = ActionType.Delete
            default:
                return nil
        }
    
        var type : ContentType
        var content : AnyObject?
        let typeStr = json["type"].string
        if typeStr == nil {
            return nil
        }
        switch typeStr! {
            case "contact":
                type = ContentType.Contact
                content = Contact.fromJson(json["content"])
            case "message":
                type = ContentType.Message
                content = Message.fromJson(json["content"])
            default:
                return nil
        }
        
        if content == nil {
            return nil
        }
        
        return Event(timestamp:timestamp!, action:action, type:type, content:content!)

    }
}