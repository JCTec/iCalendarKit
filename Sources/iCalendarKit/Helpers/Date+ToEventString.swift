/*
    XplainAPI
    Date+ToEventString.swift
 
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

extension Date {

    /// This extension will transform dates into `"yyyyMMdd'T'HHmmss'Z'"` wich is used in the iCal implementation.
    ///
    /// iCalendar (RFC 5545). https://icalendar.org/RFC-Specifications/iCalendar-RFC-5545/
    ///
    /// For more information contact
    /// Juan Carlos Estévez Rodríguez
    /// juancarlos_tec@protonmail.ch
    ///
    /// @JC_Tec_
    ///
    /// Code
    /// ----
    ///         print(date.toEventString())
    ///
    func toEventString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }

}
