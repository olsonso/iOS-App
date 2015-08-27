//
//  CalendarViewController.swift
//  CDK Interns
//
//  Created by Olson, Sonja on 7/30/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

import Foundation
import UIKit


@objc
protocol CalendarViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    
    @IBOutlet weak var mainContainer: UIView!
    var city: [String] = []
    var country: [String] = []
    var tableDataLabel: UILabel!
    var doDatItem: UITextField!
    @IBOutlet weak var meetupTableView: UITableView!
    
    var delegate: CalendarViewControllerDelegate?
    var currentVC : UIViewController?
    var data = NSMutableData()
    
    override func viewDidLoad() {
        let url = NSURL(string: "https://api.meetup.com/2/cities?&sign=true&photo-host=public&page=20")
        meetupTableView.delegate = self
        meetupTableView.dataSource = self
        startConnection()
     
    }
    
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startConnection()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        // Received a new request, clear out the data object
        self.data = NSMutableData()
    }
    
    func startConnection(){
        let urlPath: String = "https://api.meetup.com/2/cities?&sign=true&photo-host=public&page=20"
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        //self.data = NSMutableData()
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }

    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
       var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
      
        let json = JSON(jsonResult)
        
        let results = json["results"]
        let count = json["results"].count
        for var i = 0; i < count; i++ {
        let cityX = json["results"][i]["city"].stringValue
            let countryX = json["results"][i]["country"].stringValue
          println(cityX)
            city.append(cityX)
            country.append(countryX)
        
        }
        
        meetupTableView.reloadData()
      
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(self.city.count)
        return city.count
        
    }
    
   /* func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("City: "+city[indexPath.row])
    }
    */
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = self.city[indexPath.row]
        cell.detailTextLabel?.text = self.country[indexPath.row]
        return cell
    }

    
    

    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let profileVC = segue.destinationViewController as? ProfileViewController{
            currentVC = profileVC
        }
    }
    
    
    
}

extension CalendarViewController{
    func CalendaritemSelected (item: String) {
        delegate?.collapseSidePanels?()
    }
    
}
