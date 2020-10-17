/*
    XplainAPI
    Location.swift
 
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

public struct Location {
    let latitude: Float
    let longitude: Float
    
    public init(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }

    public func toString() -> String {
        return "\(latitude);\(longitude)"
    }
}
