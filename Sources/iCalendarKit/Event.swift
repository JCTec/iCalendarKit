//
//  Event.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

public final class Event{
    public static let confirmed = "CONFIRMED"
    
    public var summary: String!
    public var UID: String!
    public var sequence: Int! = 0
    public var status: String!
    public var transp: Transp!
    //public var rRule: String
    public var dtstart: Date!
    public var dtend: Date!
    public var dtstamp: Date!
    public var categories: String?
    public var location: String?
    public var geo: Location?
    public var description: String?
    public var url: URL?
    
    public init(UID: String? = UUID().uuidString, summary: String, description: String? = nil, status: String? = Event.confirmed, transp: Transp? = .transparent, dtstart: Date, dtend: Date, dtstamp: Date, categories: String? = nil) {
        self.UID = UID
        self.summary = summary.safe()
        self.description = description?.safe()
        self.status = status
        self.transp = transp
        self.dtstart = dtstart
        self.dtend = dtend
        self.dtstamp = dtstamp
        self.categories = categories
    }
    
    public func vevent() -> String{
        var str = "BEGIN:VEVENT\r\n"

        str += "SUMMARY:\(summary ?? "")\r\n"
        str += "UID:\(UID ?? UUID().uuidString)\r\n"
        str += "SEQUENCE:\(sequence ?? 0)\r\n"
        str += "STATUS:\(status ?? Event.confirmed)\r\n"
        
        str += transp.toString()
        
        //str += "RRULE:\(rRule)\r\n"

        str += "DTSTART:\(dtstart.toEventString())\r\n"
        str += "DTEND:\(dtend.toEventString())\r\n"
        str += "DTSTAMP:\(dtstamp.toEventString())\r\n"
        
        if let cat = categories{
            str += "CATEGORIES:\(cat)\r\n"
        }
        
        if let loc = location{
            str += "LOCATION:\(loc)\r\n"
        }
        
        if let geo = geo{
            str += "GEO:\(geo.toString())\r\n"
        }
        
        if let desc = description{
            str += "DESCRIPTION:\(desc)\r\n"
        }
        
        if let url = url?.absoluteString{
            str += "URL:\(url)\r\n"
        }
        
        str += "END:VEVENT\r\n"
        
        return str
    }

}
