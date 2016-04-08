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
    private var eventsArray: [TECalendarEvent]?
    
    init(delegate: CalendarViewModelDelegate){
        super.init();
        self.delegate = delegate
    }
    
    func getWebDataForEvents(){
        let request = HTTPRequestHandler()
        request.startWebRequestWithCompletion{ [unowned self](dataArray) -> Void in
         
            self.eventsArray = []

            for event in dataArray{
                
                guard let description = event["description"] as? String else {
                    return;
                }
                
                let e = TECalendarEvent()
                e.description = description
                self.eventsArray?.append(e)
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
    
    func getEventAtIndex(index: Int) -> TECalendarEvent{
        
        return eventsArray![index];
    }
}