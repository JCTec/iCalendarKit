/*
    XplainAPI
    iCalendarKitTests.swift
 
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

import XCTest
@testable import iCalendarKit

extension String{
    func toEventDate() -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self) ?? Date()
    }
}

extension String{
    func trim() -> String{
        let pattern = "[^A-Za-z0-9]+"
        let result = self.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
        return result
    }
}

final class iCalendarKitTests: XCTestCase {
    func testICalendarKit() {
        let testVCalendar =
        
        """
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:-//GeneraJCTech//JCTechJuanCarlos//ES-MX
        CALSCALE:GREGORIAN
        METHOD:PUBLISH
        BEGIN:VEVENT
        SUMMARY:AbrahamLincoln
        UID:D57DAFB2-B170-49D1-A363-D4E75055DF8C
        SEQUENCE:0
        STATUS:CONFIRMED
        TRANSP:TRANSPARENT
        DTSTART:20191109T005058Z
        DTEND:20191109T005058Z
        DTSTAMP:20191109T005058Z
        END:VEVENT
        END:VCALENDAR
        """
        
        let ical = iCalendar(prodid: Prodid(title: "Genera JCTech", name: "JCTech Juan Carlos", code: "ES-MX"))

        let event = Event(summary: "Abraham Lincoln", dtstart: "20191109T005058Z".toEventDate(), dtend: "20191109T005058Z".toEventDate(), dtstamp: "20191109T005058Z".toEventDate())
        event.UID = "D57DAFB2-B170-49D1-A363-D4E75055DF8C"

        ical.addEvent(event)
        
        let calendarString = ical.calendarString()
        
        XCTAssertEqual(calendarString.trim(), testVCalendar.trim())
    }
    
    func testAutomaticProdid() {
        let ical = iCalendar(prodid: Prodid())
        let icalTwo = iCalendar(prodid: Prodid())

        let event = Event(summary: "Abraham Lincoln", dtstart: "20191109T005058Z".toEventDate(), dtend: "20191109T005058Z".toEventDate(), dtstamp: "20191109T005058Z".toEventDate())
        event.UID = "D57DAFB2-B170-49D1-A363-D4E75055DF8C"

        ical.addEvent(event)
        icalTwo.addEvent(event)

        let calendarString = ical.calendarString()
        let calendarStringTwo = ical.calendarString()

        XCTAssertNotEqual(calendarString.trim(), calendarStringTwo.trim())
    }

    static var allTests = [
        ("testICalendarKit", testICalendarKit),
        ("testAutomaticProdid", testAutomaticProdid),
    ]
}
