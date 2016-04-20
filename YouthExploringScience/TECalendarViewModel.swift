//
//  TECalendarViewModel.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/8/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation

protocol CalendarViewModelDelegate: class{
    
    func receivedDataForEvents();
}

class TECalendarViewModel: NSObject {
    
    weak var delegate: CalendarViewModelDelegate?
    private var eventsArray: [TEGoogleCalendarEvent]?
    private var datesArray: [NSDate]?
    
    init(delegate: CalendarViewModelDelegate){
        super.init();
        self.delegate = delegate
    }
    
    func getWebDataForEvents(){
        let request = HTTPRequestHandler()
        request.startWebRequestWithCompletion{ [unowned self](dataArray) -> Void in
         
            self.eventsArray = []

            for event in dataArray{
                
//                if let description = event["description"] as? String {
//                    
//                    e.description = description;
//                }
//                
//                if let summary = event["summary"] as? String{
//                    
//                    e.summary = summary
//                }
//                guard let html = event["htmlLink"] as? String, let start = event["start"] as? NSDictionary, let end = event["end"] as? NSDictionary, let id = event["id"] as? String else {
//                    //return;
//                    break;
//                }
                
                let e1 = TEGoogleCalendarEvent(jsonObject: event as! NSDictionary)
                
//                let formatter = NSDateFormatter();
//                formatter.dateFormat = "yyyy-MM-dd"
//                e.end = TECalendarTime()
//                e.start = TECalendarTime()
//                e.start?.date = formatter.dateFromString(start["date"] as! String)
//                e.end?.date = formatter.dateFromString(end["date"] as! String)
//                //e.endDate = formatter.dateFromString(end.valueForKey("dateTime") as! String)
//                //e.startDate = formatter.dateFromString(start.valueForKey("dateTime") as! String)
//                e.htmlLink = html
//                e.id = id
                self.eventsArray?.append(e1)
            }
            
            self.delegate?.receivedDataForEvents()
        }
    }
    
    func getEventCount() -> Int{
        
        guard let _ = eventsArray else{
            return 0;
        }
        
        return eventsArray!.count;
    }
    
    func getEventAtIndex(index: Int) -> TEGoogleCalendarEvent{
        
        return eventsArray![index];
    }
    
    
    func getSeperateDateCounts() -> Int{
        
        guard let _ = datesArray else{
            return 1;
        }
        
        return 1
//        return datesArray!.count;
    }
    
    func getDateTitleAtIndex(index: Int)->String{
        
        return "April 10, 2016";
    }
    
    //Method should iterate through all events and acquire their start dates...
    //This method will return the array of start dates
    func getEventStartDates() -> [String]{
        
        return ["Hello"];
    }
}