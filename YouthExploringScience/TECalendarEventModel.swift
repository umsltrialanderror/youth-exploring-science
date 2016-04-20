//
//  TECalendarEventModel.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/16/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation

class TECalendarEventModel: NSObject {
    
    var calendarEvent : GTLCalendarEvent!
    
    override init() {
        super.init()
    }
    
    func DoesHaveMap() -> Bool{
        
        if let _ = calendarEvent.location{
            return true
        }
        
        return false
    }
    
    func DoesHaveHtml() -> Bool{
        
        if let _ = calendarEvent.htmlLink {
            return true
        }
        
        return false
    }
    
    func DoesHaveDescription() -> Bool{
        
        if let _ = calendarEvent.descriptionProperty {
            return true
        }
        
        return false
    }
    
    func GetSectionCount() -> Int{
        
        var count = 1 //for sure going to have a start and end time
    
        if(DoesHaveMap()) { count++}
        if(DoesHaveHtml()) {count++}
        if(DoesHaveDescription()) {count++}
        return count
    }
}