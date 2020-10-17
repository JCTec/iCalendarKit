/*
    XplainAPI
    iCalendarKit.swift
 
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

public final class iCalendar {
    public static let gregorian = "GREGORIAN"
    public static let publish = "PUBLISH"
    public static let version: Double = 2.0

    public var prodid: Prodid
    public var calscale: String
    public var method: String

    private var eventsInCalendar: [Event]! = [Event]()

    /// This will create an object representing the iCal object, wich then can be use to produce the iCal String/Data.
    ///
    /// This is an implementation of iCalendar (RFC 5545) implementation. https://icalendar.org/RFC-Specifications/iCalendar-RFC-5545/
    ///
    /// For more information contact
    /// Juan Carlos Estévez Rodríguez
    /// juancarlos_tec@protonmail.ch
    ///
    /// @JC_Tec_
    ///
    /// Code
    /// ----
    ///
    ///         let ical = Calendar(prodid: Prodid(title: "JCTech", name: "JCTech Juan Carlos", code: "ES-MX"))
    ///         let event = Event(summary: "Abraham Lincoln", dtstart: Date(), dtend: Date(), dtstamp: Date())
    ///
    ///         print(ical.calendarString())
    ///
    ///         //or to have the data
    ///         // ical.data()
    public init(prodid: Prodid = Prodid(), calscale: String = iCalendar.gregorian, method: String = iCalendar.publish, events: [Event]? = nil) {
        self.prodid = prodid
        self.calscale = calscale
        self.method = method

        if let ev = events {
            eventsInCalendar = ev
        }
    }

    /// This will create an object representing the iCal object, wich then can be use to produce the iCal String/Data.
    ///
    /// This is an implementation of iCalendar (RFC 5545) implementation. https://icalendar.org/RFC-Specifications/iCalendar-RFC-5545/
    ///
    /// For more information contact
    /// Juan Carlos Estévez Rodríguez
    /// juancarlos_tec@protonmail.ch
    ///
    /// @JC_Tec_
    ///
    /// Code
    /// ----
    ///
    ///         let ical = Calendar(prodid: Prodid(title: "JCTech", name: "JCTech Juan Carlos", code: "ES-MX"))
    ///         let event = Event(summary: "Abraham Lincoln", dtstart: Date(), dtend: Date(), dtstamp: Date())
    ///
    ///         print(ical.calendarString())
    ///
    ///         //or to have the data
    ///         // ical.data()
    public init(prodid: Prodid, events: [Event]? = nil) {
        self.prodid = prodid
        self.calscale = iCalendar.gregorian
        self.method = iCalendar.publish

        if let ev = events {
            eventsInCalendar = ev
        }
    }

    public func setEvents(_ events: [Event]) {
        eventsInCalendar.removeAll()
        eventsInCalendar = events
    }

    public func addEvent(_ event: Event) {
        eventsInCalendar.append(event)
    }

    public func removeEvent(_ event: Event) {
        eventsInCalendar = eventsInCalendar.filter { $0.UID != event.UID }
    }

    public func removeAll() {
        eventsInCalendar.removeAll()
    }

    public func calendarString() -> String {

        var str = "BEGIN:VCALENDAR\r\n"

        str += "VERSION:\(iCalendar.version)\r\n"
        str += "PRODID:\(prodid.generate())\r\n"
        str += "CALSCALE:\(calscale)\r\n"
        str += "METHOD:\(method)\r\n"

        for event in eventsInCalendar {
            str += event.vevent()
        }

        str += "END:VCALENDAR\r\n"

        return str
    }

    public func data() -> Data? {
        return calendarString().data(using: .utf8)
    }
}
