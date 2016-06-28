//
//  TableViewCellEvents.swift
//  appBeer
//
//  Created by Jeferson Montanha on 28/06/16.
//  Copyright © 2016 Jeferson Montanha. All rights reserved.
//

import UIKit

class TableViewCellEvents: UITableViewCell {

    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventName: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
