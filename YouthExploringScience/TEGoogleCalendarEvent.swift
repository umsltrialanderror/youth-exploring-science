//
//  TEGoogleCalendarEvent.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/11/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

/*

{
    "kind": "calendar#event",
    "etag": etag,
    "id": string,
    "status": string,
    "htmlLink": string,
    "created": datetime,
    "updated": datetime,
    "summary": string,
    "description": string,
    "location": string,
    "colorId": string,
    "creator": {
    "id": string,
    "email": string,
    "displayName": string,
    "self": boolean
},
"organizer": {
    "id": string,
    "email": string,
    "displayName": string,
    "self": boolean
},
"start": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
},
"end": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
},
    "endTimeUnspecified": boolean,
    "recurrence": [
    string
    ],
    "recurringEventId": string,
    "originalStartTime": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
},
    "transparency": string,
    "visibility": string,
    "iCalUID": string,
    "sequence": integer,
    "attendees": [
        {
            "id": string,
            "email": string,
            "displayName": string,
            "organizer": boolean,
            "self": boolean,
            "resource": boolean,
            "optional": boolean,
            "responseStatus": string,
            "comment": string,
            "additionalGuests": integer
        }
    ],
    "attendeesOmitted": boolean,
    "extendedProperties": {
    "private": {
        (key): string
    },
    "shared": {
    (key): string
    }
},
    "hangoutLink": string,
    "gadget": {
    "type": string,
    "title": string,
    "link": string,
    "iconLink": string,
    "width": integer,
    "height": integer,
    "display": string,
    "preferences": {
        (key): string
    }
},
    "anyoneCanAddSelf": boolean,
    "guestsCanInviteOthers": boolean,
    "guestsCanModify": boolean,
    "guestsCanSeeOtherGuests": boolean,
    "privateCopy": boolean,
    "locked": boolean,
    "reminders": {
    "useDefault": boolean,
    "overrides": [
        {
            "method": string,
            "minutes": integer
        }
    ]
},
    "source": {
    "url": string,
    "title": string
},
    "attachments": [
{
    "fileUrl": string,
    "title": string,
    "mimeType": string,
    "iconLink": string,
    "fileId": string
    }
]
}*/

import Foundation

private class TECalendarPersonnel: NSObject{

    var id : String?
    var email : String?
    var displayName : String?
    var isSelf : Bool?
}

private class TECalendarTime: NSObject{

    var date: NSDate?
    var dateTime: NSDate?
    var timeZone : NSTimeZone?
}

private class TECalendarAttendee: NSObject{

    var id: String?
    var email: String?
    var displayName: String?
    var organizer: Bool?
    var isSelf : Bool?
    var resource : Bool?
    var optional: Bool?
    var responseStatus: String?
    var comment: String?
    var additionalGuests: Int?
}

class TEGoogleCalendarEvent: NSObject {
    
    internal var id : String?
    internal var status : String?
    internal var htmlLink : String?
    internal var created : NSDate?
    internal var updated : NSDate?
    internal var summary : String?
    internal var eventDescription : String?
    internal var location : String?
    internal var colorId : String?
    private var creator: TECalendarPersonnel?
    private var organizer: TECalendarPersonnel?
    private var start : TECalendarTime?
    private var end : TECalendarTime?
    internal var attendeesOmitted : Bool?
    internal var attendees : NSMutableArray?
    
    private var jsonObject: NSDictionary!
    
    init(jsonObject: NSDictionary) {
        super.init();
        
        self.jsonObject = jsonObject
    }
    
    private func ParseJSONObject(object: NSDictionary){
        
        //id
        if let i = object["id"] as? String{ self.id = i }
        
        //html link
        if let html = object["htmlLink"] as? String{ self.htmlLink = html }
        
        //summary
        if let sum = object["summary"] as? String { self.summary = sum }
        
        //descript
        if let desc = object["description"] as? String { self.eventDescription = desc }
        
        if let start = object["start"] as? NSDictionary {
            
            let dateFormatter = NSDateFormatter()
            
            let et = TECalendarTime()
            self.start = et
            
            if let date = start["date"] as? String {
                
                dateFormatter.timeZone = NSTimeZone(abbreviation: "America/Chicago");
                dateFormatter.dateFormat = "yyyy-MM-dd"
                et.date = dateFormatter.dateFromString(date)
            }
        
        }
        
    }
    
    func GetSectionCount() -> Int{
        
        var count: Int = 0;
        
        if(jsonObject["description"] != nil) { count++ }
        if(jsonObject["start"] != nil) {count++}
        if(jsonObject["end"] != nil) {count++}
        if(jsonObject["htmlLink"] != nil) {count++}
        
        return count;
    }
    
    func GetRowsPerSection(section: Int) -> Int{
        
        switch(section){
        case 0: return 1
        case 1: return 1
        case 2: return 1
        default: return 1
        }
    }
}













