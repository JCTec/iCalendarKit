//
//  File.swift
//  
//
//  Created by Juan Carlos Estevez on 09/11/19.
//

import Foundation

extension String{
    
    func safe(length: Int = 60, trailing: String = "…") -> String {
        if self.count > length {
            return self.prefix(length) + trailing
        } else {
            return self
        }
    }
    
}
