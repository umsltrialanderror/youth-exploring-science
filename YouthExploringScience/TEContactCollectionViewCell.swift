//
//  TEContactCollectionViewCell.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/7/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEContactCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var portraitView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame);
//        
//        nameLabel.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.2).active = true;
//        nameLabel.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true;
//        nameLabel.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true;
//        nameLabel.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true;
//        
//        portraitView.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.8).active = true;
//        portraitView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true;
//        portraitView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true;
//        portraitView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}