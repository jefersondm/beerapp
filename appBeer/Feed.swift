//
//  Feed.swift
//  appBeer
//
//  Created by Jeferson Montanha on 28/06/16.
//  Copyright © 2016 Jeferson Montanha. All rights reserved.
//

import Foundation

    class Feed{
        
        let items: [FeedItem]
        let sourceURL: NSURL
        
        init (items newItems: [FeedItem], sourceURL newURL: NSURL) {
            self.items = newItems
            self.sourceURL = newURL
        }
        
        convenience init? (data: NSData, sourceURL url: NSURL) {
            var newItems = [FeedItem]()
            
            
            
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
                let description = itemDict["description"] as? String
                let isOrganic = itemDict["isOrganic"] as? String
                let status = itemDict["status"] as? String
                let createDate = itemDict["createDate"] as? String
                //
                
    
                
                newItems.append(FeedItem(name: name ?? "no info", id: id ?? "no info", description: description ?? "no info", isOrganic: isOrganic ?? "no info" , status: status ?? "no info", createDate: createDate ?? "no info"))
                
            }
            
            self.init(items: newItems, sourceURL: url)
            
        }
    
    }