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
        
        //setupViewStyle()
       
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewStyle(){
        viewInfos.layer.borderWidth = 1
        viewInfos.layer.cornerRadius = 10
        viewInfos.layer.borderColor = UIColor.grayColor().CGColor
        
        detailImg.layer.cornerRadius = 10;
        detailImg.layer.masksToBounds = true;
        
        detailImg.layer.borderColor = UIColor.grayColor().CGColor;
        detailImg.layer.borderWidth = 0.5;
        
        detailImg.layer.contentsScale = UIScreen.mainScreen().scale;
        detailImg.layer.shadowColor = UIColor.blackColor().CGColor;
        detailImg.layer.shadowOffset = CGSizeZero;
        detailImg.layer.shadowRadius = 5.0;
        detailImg.layer.shadowOpacity = 0.5;
        detailImg.layer.masksToBounds = false;
        detailImg.clipsToBounds = false;
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
