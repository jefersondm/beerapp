//
//  NewViewController.swift
//  appBeer
//
//  Created by Jeferson Montanha on 28/06/16.
//  Copyright © 2016 Jeferson Montanha. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var organicLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var createDateLabel: UILabel!
    
    
    @IBOutlet var viewInfos: UIView!
    
    
    
    var img = UIImage()
    var text = String()
    var textId = String()
    var textDesc = String()
    var textOrganic = String()
    var textStatus = String()
    var textCreateDate = String()

    @IBOutlet var detailImg: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    
    
    @IBAction func onClickDone(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImg.image = img
        self.detailLabel.text = text
        
        self.idLabel.text = textId
        self.organicLabel.text = textOrganic
        self.statusLabel.text = textStatus
        self.createDateLabel.text = textCreateDate
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
