//
//  TEEventCellCalendarView.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/16/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEEventCellCalendarView: UIView {

    private var roundedRectShape = TECalendarBackground()
    private var dayOfWeekView : TEDayOfWeekView!
    private var dayView : TEDayView!
    private var dayLabel = UILabel(frame: CGRectZero)
    private var dayOfWeekLabel = UILabel(frame: CGRectZero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews(CGRectZero)
    }
    
    private func setupViews(frame: CGRect){
        
        dayOfWeekLabel = UILabel(frame: frame)
        dayOfWeekLabel.textAlignment = .Center
        dayOfWeekLabel.textColor = UIColor.darkGrayColor()
        self.addSubview(dayOfWeekLabel)
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekLabel.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        dayOfWeekLabel.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
//        dayOfWeekView = TEDayOfWeekView(frame: CGRectZero)
//        dayOfWeekView.backgroundColor = UIColor.whiteColor()
//        dayOfWeekView.label.textColor = UIColor.darkGrayColor()
//        self.addSubview(dayOfWeekView)
//        
//        dayView = TEDayView(frame: CGRectZero)
//        dayView.label.textColor = UIColor.whiteColor()
//        dayView.backgroundColor = UIColor.darkGrayColor()
//        self.addSubview(dayView)
        
    }
    
    override func drawRect(rect: CGRect) {
        roundedRectShape.frame = rect
        layer.addSublayer(roundedRectShape)
    }
    
    var dayOfWeekString : String = "Sun" {
        
        didSet{
            dayOfWeekLabel.text = dayOfWeekString
        }
    }
    
    var dayString : String = "01" {
        
        didSet{
            dayLabel.text = dayString
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.clearColor()
    }
//
    override func addSubview(view: UIView) {
        super.addSubview(view)
        
        view.bringSubviewToFront(dayOfWeekLabel)
        view.setNeedsLayout()
    }
//
//    private func setupView(view: UIView){
//        
//        if(view .isKindOfClass(TEDayOfWeekView)){
//            
//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.topAnchor.constraintEqualToAnchor(topAnchor).active = true
//            view.leftAnchor.constraintEqualToAnchor(leftAnchor).active = true
//            view.rightAnchor.constraintEqualToAnchor(rightAnchor).active = true
//            view.heightAnchor.constraintEqualToAnchor(heightAnchor, multiplier: 0.6)
//        }
//        else if (view.isKindOfClass(TEDayView)){
//            
//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.bottomAnchor.constraintEqualToAnchor(bottomAnchor).active = true
//            view.leftAnchor.constraintEqualToAnchor(leftAnchor).active = true
//            view.rightAnchor.constraintEqualToAnchor(rightAnchor).active = true
//            view.heightAnchor.constraintEqualToAnchor(heightAnchor, multiplier: 0.4)
//        }
//    }
}
