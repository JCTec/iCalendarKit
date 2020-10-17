# iCalendarKit [![Build Status](https://travis-ci.org/JCTec/iCalendarKit.svg?branch=master)](https://travis-ci.org/JCTec/iCalendarKit)

iCalendar (RFC 5545) implementation in Swift created by Juan Carlos Estévez Rodríguez.

## Getting Started

iCalendarKit is a Swift package build to generate iCal 5545 String/Data compatible with the latest calendar software. iCalendarKit is compatible with bothb Google Calendar and Apple Calendar.

## Implementation

```swift
let ical = Calendar(prodid: Prodid(title: "JCTech", name: "JCTech Juan Carlos", code: "ES-MX"))

let event = Event(summary: "Abraham Lincoln", dtstart: Date(), dtend: Date(), dtstamp: Date())

print(ical.calendarString())

//or to have the data
// ical.data()
```
