//
//  Calendar.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

public final class iCalendar{
    static let gregorian = "GREGORIAN"
    static let publish = "PUBLISH"
    static let version: Double = 2.0

    var prodid: Prodid!
    var calscale: String!
    var method: String!
        
    private var eventsInCalendar: [Event]! = [Event]()
    
    init(prodid: Prodid = Prodid(), calscale: String = iCalendar.gregorian, method: String = iCalendar.publish, events: [Event]? = nil) {
        self.prodid = prodid
        self.calscale = calscale
        self.method = method
        
        if let ev = events{
            eventsInCalendar = ev
        }
    }
    
    init(prodid: Prodid, events: [Event]? = nil) {
        self.prodid = prodid
        self.calscale = iCalendar.gregorian
        self.method = iCalendar.publish
        
        if let ev = events{
            eventsInCalendar = ev
        }
    }
    
    func setEvents(_ events: [Event]){
        eventsInCalendar.removeAll()
        eventsInCalendar = events
    }
    
    func addEvent(_ event: Event){
        eventsInCalendar.append(event)
    }
    
    func removeEvent(_ event: Event){
        eventsInCalendar = eventsInCalendar.filter { $0.UID != event.UID }
    }
    
    func removeAll(){
        eventsInCalendar.removeAll()
    }
    
    func calendarString() -> String{
        
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
    
    func data() -> Data?{
        return calendarString().data(using: .utf8)
    }
}
