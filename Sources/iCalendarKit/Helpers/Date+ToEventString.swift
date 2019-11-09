//
//  Date+ToEventString.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

extension Date {

    func toEventString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
}

