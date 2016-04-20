//
//  TEEventLinkTableViewCell.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/16/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEEventLinkTableViewCell: UITableViewCell {

    var htmlLink : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonPresses(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: htmlLink)!)

    }
}
