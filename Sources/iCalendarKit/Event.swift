//
//  Event.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

final class Event{
    static let confirmed = "CONFIRMED"
    
    var summary: String!
    var UID: String!
    var sequence: Int! = 0
    var status: String!
    var transp: Transp!
    //var rRule: String
    var dtstart: Date!
    var dtend: Date!
    var dtstamp: Date!
    var categories: String?
    var location: String?
    var geo: Location?
    var description: String?
    var url: URL?
    
    init(UID: String? = UUID().uuidString, summary: String, description: String? = nil, status: String? = Event.confirmed, transp: Transp? = .transparent, dtstart: Date, dtend: Date, dtstamp: Date, categories: String? = nil) {
        self.UID = UID
        self.summary = summary
        self.description = description
        self.status = status
        self.transp = transp
        self.dtstart = dtstart
        self.dtend = dtend
        self.dtstamp = dtstamp
        self.categories = categories
    }
    
    func vevent() -> String{
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
