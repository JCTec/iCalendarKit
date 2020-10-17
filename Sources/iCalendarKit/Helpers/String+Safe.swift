/*
    XplainAPI
    String+Safe.swift
 
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

extension String {

    /// This extension will enable the use of String.safe() wich will crop the string into 60 characters only because of iCalendar specifications.
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
    ///         print(str.safe())
    ///
    func safeCalendarString(length: Int = 60, trailing: String = "…") -> String {
        if self.count > length {
            return self.prefix(length) + trailing
        } else {
            return self
        }
    }
    
}
