//
//  TableViewControllerEvents.swift
//  appBeer
//
//  Created by Jeferson Montanha on 28/06/16.
//  Copyright © 2016 Jeferson Montanha. All rights reserved.
//

import UIKit

class TableViewControllerEvents: UITableViewController {
    
    
    var url = NSURL(string:"https://api.brewerydb.com/v2/categories?key=d1a8bb7bd4997a2436209c8f5d71cd5b&name=a")
    
    var feed: FeedEvent?{
        didSet{
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        
        self.updateFeed(url!, completion: { (feed) -> Void in
            self.feed = feed
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.feed)
        if(feed != nil) {
            return (feed?.items.count)!
        }
        else{
            return 10
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellEvents") as! TableViewCellEvents
        
        if feed != nil {
            cell.eventName.text = feed?.items[indexPath.row].name
            cell.eventDate.text = feed?.items[indexPath.row].createDate
        }
        else{
            
        }
        
        return cell
    }
    
    func updateFeed(url: NSURL, completion: (feed: FeedEvent?) -> Void) {
        let request = NSURLRequest(URL: url)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil && data != nil {
                let feed = FeedEvent(data: data!, sourceURL: url)
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    completion(feed: feed)
                })
            }
            
        }
        
        task.resume()
    }


}
