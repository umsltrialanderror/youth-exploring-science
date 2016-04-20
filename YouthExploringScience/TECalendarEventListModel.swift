//
//  TECalendarEventListModel.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/13/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation

protocol TECalendarEventListDelegate: NSObjectProtocol {
    
    func didFinishFetchingData()
}

class TECalendarEventListModel: NSObject {
    
    private let kClientID = "902076726155-v2kcfuq83uoirgdiqeqngk7btqr425vq.apps.googleusercontent.com"
    private let API_KEY = "AIzaSyAScyYwpusoKCbBheotRha5U9fl4Kg1K-A"
    private let service = GTLServiceCalendar()
    private var allEvents: NSMutableArray!
    private var startDates: NSMutableArray!
    private var endDates: NSMutableArray!
    weak var delegate: TECalendarEventListDelegate?
    
    override init() {
        super.init()
        service.APIKey = API_KEY
        allEvents = NSMutableArray()
        startDates = NSMutableArray()
        endDates = NSMutableArray()
    }
    
    func fetchEvents(){
        
        let query = GTLQueryCalendar.queryForEventsListWithCalendarId("c8tu9s8pfnpkfstv7nu4k6o8bs@group.calendar.google.com")
        query.timeMin = GTLDateTime(date: NSDate().dateByAddingTimeInterval(-24 * 60 * 60 * 30), timeZone: NSTimeZone.localTimeZone())
        query.singleEvents = true
        query.orderBy = kGTLCalendarOrderByStartTime
        service.executeQuery(
            query,
            delegate: self,
            didFinishSelector: "fetchEventsDidFinish:finishedWithObject:error:")
    }
    
    func fetchEventsDidFinish(ticket: GTLServiceTicket, finishedWithObject response: GTLCalendarEvents, error: NSError?){
        
        var tempEventArray = [GTLCalendarEvent]() //temporary container to hold all of the events
        
        if let events = response.items() where !events.isEmpty {
            
            for event in events as! [GTLCalendarEvent] {
                
                event.summary = event.summary ?? "(No Title)"
                
                tempEventArray.append(event);
            }
            
        }
        else {
            //No upcoming events found
        }
        
        CreateEventsArrayFromArray(tempEventArray)
        
        delegate?.didFinishFetchingData()
    }
    
    func GetEventsForSectionCount(section: Int) -> Int{
        
        
        return allEvents[section].count
    }
    
    func GetEventAtSection(section: Int, andIndex index: Int)-> GTLCalendarEvent{
        
        let events = allEvents[section] as! NSMutableArray
        
        return events[index] as! GTLCalendarEvent
    }
    
    func GetEventAtIndex(index: Int) -> GTLCalendarEvent{
        
        return allEvents[index] as! GTLCalendarEvent
    }
    
    func GetStartDateAtIndex(index: Int) -> NSDate{
        
        return startDates[index] as! NSDate;
    }
    
    func GetDateCount() -> Int{
        
        return startDates.count
    }
    
    private func CreateEventsArrayFromArray(array: [GTLCalendarEvent]){
        
        //before we can make 2d array of events... we need an array of start dates
        //this loop will create the start dates
        
        var tempStartDates = [NSDate]()
        for event in array{
            
            let start: GTLDateTime! = event.start.dateTime ?? event.start.date //event start time
            var flag = true
            
            //iterate through all start dates
            for date in tempStartDates{
                
                //get the comparison result
                let order = NSCalendar.currentCalendar().compareDate(start.date, toDate: date , toUnitGranularity: .Day)
                
                if (order == NSComparisonResult.OrderedSame){
                    
                    flag = false
                }
            }
            
            if(flag){
                
                tempStartDates.append(start.date)
            }
        }
        
        //add the dates to the main array
        startDates.addObjectsFromArray(tempStartDates)
        
        //now that we have the start dates figured out.. let's form the main events array
        
        for index in 0 ... (startDates.count - 1) {
            
            let date = startDates[index]
            let tempEventArray = NSMutableArray()
            
            for event in array{
                
                let start: GTLDateTime! = event.start.dateTime ?? event.start.date
                
                let order = NSCalendar.currentCalendar().compareDate(start.date, toDate: date as! NSDate, toUnitGranularity: .Day)
                
                if(order == NSComparisonResult.OrderedSame){
                    
                    tempEventArray.addObject(event)
                }
            }
            
            allEvents[index] = tempEventArray
        }
        
    }
}