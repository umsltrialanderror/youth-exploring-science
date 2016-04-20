//
//  TEDayOfWeekView.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/16/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEDayOfWeekView: UIView {

    var label = UILabel(frame: CGRectZero)
    
    
    override func drawRect(rect: CGRect) {
        
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = rect
        label.textAlignment = .Center
        label.font = UIFont(name: "Helvetica", size: rect.size.width - rect.size.width * 0.2)
        label.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        label.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
    }
}
