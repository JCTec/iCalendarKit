/*
    XplainAPI
    Prodid.swift
 
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

public struct Prodid {
    let title: String?
    let name: String?
    let code: String?

    public init(title: String, name: String, code: String? = nil) {
        self.title = title
        self.name = name
        self.code = code
    }

    public init() {
        self.title = nil
        self.name = nil
        self.code = nil
    }

    public func generate() -> String {
        return "-//\(title?.safeCalendarString(length: 22) ?? "Empty-\(UUID().uuidString)")//\(name?.safeCalendarString(length: 22) ?? "Empty-\(UUID().uuidString)")//\(code ?? "EN")".safeCalendarString()
    }
}
