//
//  Prodid.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

public struct Prodid{
    let title: String?
    let name: String?
    let code: String?
    
    init(title: String, name: String, code: String? = nil) {
        self.title = title
        self.name = name
        self.code = code
    }
    
    init() {
        self.title = nil
        self.name = nil
        self.code = nil
    }
    
    func generate() -> String{
        if title == nil || name == nil{
            return uuidString()
        }
        
        return "-//\(title!)//\(name!)//\(code ?? "EN")"
    }
    
    private func uuidString() -> String{
        return UUID().uuidString
    }
}
