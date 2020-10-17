/*
    XplainAPI
    Event.swift
 
    Copyright (C) 2019 JC_Tec_
    Juan Carlos Estévez Rodríguez
    juancarlos_tec@protonmail.ch

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, at version 3 of the License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
*/

import Foundation

public final class Event {
    public static let confirmed = "CONFIRMED"

    public var summary: String
    public var UID: String
    public var sequence: Int = 0
    public var status: String
    public var transp: Transp
    //public var rRule: String
    public var dtstart: Date
    public var dtend: Date
    public var dtstamp: Date
    public var categories: String?
    public var location: String?
    public var geo: Location?
    public var description: String?
    public var url: URL?

    public init(UID: String = UUID().uuidString, summary: String, description: String? = nil, status: String = Event.confirmed, transp: Transp = .transparent, dtstart: Date, dtend: Date, dtstamp: Date, categories: String? = nil) {
        self.UID = UID
        self.summary = summary.safeCalendarString()
        self.description = description?.safeCalendarString()
        self.status = status
        self.transp = transp
        self.dtstart = dtstart
        self.dtend = dtend
        self.dtstamp = dtstamp
        self.categories = categories
    }

    public func vevent() -> String {
        var str = "BEGIN:VEVENT\r\n"

        str += "SUMMARY:\(summary)\r\n"
        str += "UID:\(UID)\r\n"
        str += "SEQUENCE:\(sequence)\r\n"
        str += "STATUS:\(status)\r\n"

        str += transp.toString()

        //str += "RRULE:\(rRule)\r\n"

        str += "DTSTART:\(dtstart.toEventString())\r\n"
        str += "DTEND:\(dtend.toEventString())\r\n"
        str += "DTSTAMP:\(dtstamp.toEventString())\r\n"

        if let cat = categories {
            str += "CATEGORIES:\(cat)\r\n"
        }

        if let loc = location {
            str += "LOCATION:\(loc)\r\n"
        }

        if let geo = geo {
            str += "GEO:\(geo.toString())\r\n"
        }

        if let desc = description {
            str += "DESCRIPTION:\(desc)\r\n"
        }

        if let url = url?.absoluteString {
            str += "URL:\(url)\r\n"
        }

        str += "END:VEVENT\r\n"

        return str
    }

}
