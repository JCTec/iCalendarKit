# iCalendarKit

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

## Backers

<a
    href="https://github.com/JCTec">
    <img src="https://avatars0.githubusercontent.com/u/25288448?s=460&u=92477e7e8b7cae52c7ae2e075c19d615c606586e&v=4" width=80px>
</a>
