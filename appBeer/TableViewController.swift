//
//  TableViewController.swift
//  appBeer
//
//  Created by Jeferson Montanha on 28/06/16.
//  Copyright © 2016 Jeferson Montanha. All rights reserved.
//

import Foundation
import UIKit

class TableViewController : UITableViewController{
    
    
    let url = NSURL(string:"https://api.brewerydb.com/v2/beers?key=d1a8bb7bd4997a2436209c8f5d71cd5b&abv=10")
    
    var feed: Feed? {
        didSet {
            
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        self.updateFeed(url!, completion: { (feed) -> Void in
            self.feed = feed
        })
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(feed != nil) {
            return (feed?.items.count)!
        }
        else{
            return 10
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCellController
        
        
        if feed != nil {
            cell.labelName.text = feed?.items[indexPath.row].name
            cell.labelDescription.text = feed?.items[indexPath.row].description
            cell.imageView?.image = UIImage(named: "cerveja")
        }
        else{
            
        }
      
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("details", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPaths = self.tableView.indexPathForSelectedRow
        
        
        
        if segue.identifier == "details"{
            let info = segue.destinationViewController as! NewViewController
            if feed != nil {
                info.text = (feed?.items[(indexPaths?.row)!].name)!
                info.textId = (feed?.items[(indexPaths?.row)!].id)!
                info.textDesc = (feed?.items[(indexPaths?.row)!].description)!
                info.textOrganic = (feed?.items[(indexPaths?.row)!].isOrganic)!
                info.textStatus = (feed?.items[(indexPaths?.row)!].status)!
                info.textCreateDate = (feed?.items[(indexPaths?.row)!].createDate)!
                
                
                
                info.img = UIImage(named: "cerveja")!
            }
            
        }
    }
    
    
    func updateFeed(url: NSURL, completion: (feed: Feed?) -> Void) {
        let request = NSURLRequest(URL: url)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil && data != nil {
                let feed = Feed(data: data!, sourceURL: url)
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    completion(feed: feed)
                })
            }
            
        }
        
        task.resume()
    }


}