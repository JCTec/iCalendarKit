//
//  Location.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

public struct Location{
    let latitude: Float!
    let longitude: Float!
    
    func toString() -> String{
        return "\(latitude ?? Float(0.0));\(longitude ?? Float(0.0))"
    }
}
