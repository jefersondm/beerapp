//
//  FeedEvent.swift
//  appBeer
//
//  Created by Jeferson Montanha on 28/06/16.
//  Copyright © 2016 Jeferson Montanha. All rights reserved.
//

import Foundation

class FeedEvent{
    
    let items: [FeedItemEvent]
    let sourceURL: NSURL
    
    init (items newItems: [FeedItemEvent], sourceURL newURL: NSURL) {
        self.items = newItems
        self.sourceURL = newURL
    }
    
    convenience init? (data: NSData, sourceURL url: NSURL) {
        var newItems = [FeedItemEvent]()
        
        
        
        var jsonObject: Dictionary<String, AnyObject>?
        
        do {
            jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? Dictionary<String,AnyObject>
        } catch {
            
        }
        
        guard let feedRoot = jsonObject else {
            return nil
        }
        
        guard let items = feedRoot["data"] as? Array<AnyObject>  else {
            return nil
        }
        
        
        for item in items {
            
            guard let itemDict = item as? Dictionary<String,AnyObject> else {
                continue
            }
            //
            let id = itemDict["id"] as? String
            let name = itemDict["name"] as? String
            let createDate = itemDict["createDate"] as? String
            //
            
            
            
            newItems.append(FeedItemEvent(name: name ?? "no info", id: id ?? "no info",createDate: createDate ?? "no info"))
            
        }
        
        self.init(items: newItems, sourceURL: url)
        
    }
    
}