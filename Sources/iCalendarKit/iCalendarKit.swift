//
//  Calendar.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

public final class iCalendar{
    public static let gregorian = "GREGORIAN"
    public static let publish = "PUBLISH"
    public static let version: Double = 2.0

    public var prodid: Prodid!
    public var calscale: String!
    public var method: String!
        
    private var eventsInCalendar: [Event]! = [Event]()
    
    public init(prodid: Prodid = Prodid(), calscale: String = iCalendar.gregorian, method: String = iCalendar.publish, events: [Event]? = nil) {
        self.prodid = prodid
        self.calscale = calscale
        self.method = method
        
        if let ev = events{
            eventsInCalendar = ev
        }
    }
    
    public init(prodid: Prodid, events: [Event]? = nil) {
        self.prodid = prodid
        self.calscale = iCalendar.gregorian
        self.method = iCalendar.publish
        
        if let ev = events{
            eventsInCalendar = ev
        }
    }
    
    public func setEvents(_ events: [Event]){
        eventsInCalendar.removeAll()
        eventsInCalendar = events
    }
    
    public func addEvent(_ event: Event){
        eventsInCalendar.append(event)
    }
    
    public func removeEvent(_ event: Event){
        eventsInCalendar = eventsInCalendar.filter { $0.UID != event.UID }
    }
    
    public func removeAll(){
        eventsInCalendar.removeAll()
    }
    
    public func calendarString() -> String{
        
        var str = "BEGIN:VCALENDAR\r\n"
        
        str += "VERSION:\(iCalendar.version)\r\n"
        str += "PRODID:\(prodid.generate())\r\n"
        str += "CALSCALE:\(calscale ?? iCalendar.gregorian)\r\n"
        str += "METHOD:\(method ?? iCalendar.publish)\r\n"
        
        for event in eventsInCalendar{
            str += event.vevent()
        }
        
        str += "END:VCALENDAR\r\n"
        
        return str
    }
    
    public func data() -> Data?{
        return calendarString().data(using: .utf8)
    }
}
