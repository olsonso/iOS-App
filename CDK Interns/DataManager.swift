//
//  DataManager.swift
//  CDK Interns
//
//  Created by Halper, Elizabeth on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation

class DataManager {
    
    static let sharedInstance = DataManager()
    
    private var Contacts: [Int : Contact]
    private var Messages: [Int : Message]
    private var LastTimestamp : Double

    init?()
    {
        self.LastTimestamp = 0.0;
        self.Contacts = [Int : Contact]()
        self.Messages = [Int : Message]()
    }
    
    func getContacts() -> [Contact]
    {
        return Contacts.values.array
    }
    
    func getMessages() -> [Message]
    {
        return Messages.values.array
    }
    
    func getUpdateAsync() {
        /*
        updateFromFileWithSuccess { (data) -> Void in
            var eventSequence : [Event]
            let json = JSON(data: data)
            if let jsonEvents = json["events"].array {
                for je in jsonEvents {
                    if let e = Event(json: je) {
                        eventSequence.append(e)
                    }
                }
                
                eventSequence.sort { $0.timestamp > $1.timestamp }
            }
        }
        */
    }
    
    func updateFromFileAsync()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let filePath = NSBundle.mainBundle().pathForResource("testevents",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                                 options: NSDataReadingOptions.DataReadingUncached,
                                 error:&readError) {
                self.updateFromJsonData(data)
            }
        })
    }

    func updateFromJsonData(data: NSData)
    {
        let json = JSON(data:data)
        if let jsonEvents = json["events"].array {
            var eventSequence = [Event]()
            
            for je in jsonEvents {
                if let e = Event.fromJson(je) {
                    eventSequence.append(e)
                }
            }
            
            func cmp(e1:Event,e2:Event)->Bool { return e1.Timestamp > e2.Timestamp }
            
            sort(&eventSequence, cmp)
            for e in eventSequence {
                switch e.Type {
                    case Event.ContentType.Contact:
                        processContactEvent(e)
                    case Event.ContentType.Message:
                        processMessageEvent(e)
                }
            }
        }
    }
    
    func processContactEvent(e: Event) {
        let c = e.Content as! Contact
        switch e.Action {
            case Event.ActionType.Create:
                createContact(c)
            case Event.ActionType.Update:
                updateContact(c)
            case Event.ActionType.Delete:
                deleteContact(c.Id)
        }
    }
    
    func createContact(c: Contact) {
        if Contacts.indexForKey(c.Id) == nil {
            Contacts[c.Id] = c
        }
    }
    
    func updateContact(c: Contact) {
        if Contacts.indexForKey(c.Id) != nil {
            Contacts[c.Id] = c
        }
    }
    
    func deleteContact(id: Int) {
        Contacts.removeValueForKey(id)
    }
    
    func processMessageEvent(e: Event) {
        let m = e.Content as! Message
        switch e.Action {
            case Event.ActionType.Create:
                createMessage(m)
            case Event.ActionType.Update:
                updateMessage(m)
            case Event.ActionType.Delete:
                deleteMessage(m.Id)
        }
    }
    
    func createMessage(m: Message) {
        if Messages.indexForKey(m.Id) == nil {
            Messages[m.Id] = m
        }
    }
    
    func updateMessage(m: Message) {
        if Messages.indexForKey(m.Id) != nil {
            Messages[m.Id] = m
        }
    }
    
    func deleteMessage(id: Int) {
        Messages.removeValueForKey(id)
    }

    /*class func getTopAppsDataFromItunesWithSuccess(success: ((iTunesData: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: TopAppURL)!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(iTunesData: urlData)
            }
        })
    }*/
    
    /*
    class func getInternDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        //1
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //2
            let filePath = NSBundle.mainBundle().pathForResource("testauthors",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
    
    class func getMessageDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        //1
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //2
            let filePath = NSBundle.mainBundle().pathForResource("testevents",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    */
}