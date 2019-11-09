//
//  Transp.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

public enum Transp{
    case transparent
    case opaque
    
    public func toString() -> String {
        switch self {
            case .transparent:
                return "TRANSP:TRANSPARENT\r\n"
            case .opaque:
                return "TRANSP:OPAQUE\r\n"
        }
    }
}
