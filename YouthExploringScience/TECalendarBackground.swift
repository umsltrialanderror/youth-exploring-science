//
//  TECalendarBackground.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/16/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TECalendarBackground: CAShapeLayer {

    override func layoutSublayers() {
        
        let borderRect = CAShapeLayer()
        borderRect.contentsScale = UIScreen.mainScreen().scale
        borderRect.lineWidth = 1.5
        borderRect.fillColor = UIColor.whiteColor().CGColor
        borderRect.strokeColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).CGColor
        let path: CGMutablePathRef = CGPathCreateMutable()
        CGPathAddRoundedRect(path, nil, CGRectInset(bounds, 1, 1), 0, 0)
        borderRect.path = path
        borderRect.bounds = bounds
        borderRect.position = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
        addSublayer(borderRect)
        
//        let bottomRect = CAShapeLayer()
//        bottomRect.contentsScale = UIScreen.mainScreen().scale
//        bottomRect.fillColor = UIColor.darkGrayColor().CGColor
//        let path1: CGMutablePathRef = CGPathCreateMutable()
//        CGPathAddRect(path1, nil, CGRectInset(bounds, 1, 1))
//        bottomRect.path = path1
//        bottomRect.bounds = CGRectMake(0, 0, bounds.width, bounds.height * 0.4)
//        bottomRect.position = CGPointMake(CGRectGetMidX(bounds), CGRectGetHeight(bounds))
//        addSublayer(bottomRect)
    }
}
