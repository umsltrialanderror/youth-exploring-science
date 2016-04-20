//
//  TEEventListTableViewCell.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/14/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEEventListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var calendarView: TEEventCellCalendarView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
