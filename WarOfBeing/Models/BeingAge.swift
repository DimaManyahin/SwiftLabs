//
//  BeingAge.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/27/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

enum BeingAge : UInt, Comparable {
    
    case child
    case teenager
    case adult
    case elderly
    case old
    case dead
    
    func isReproductive() -> Bool {
        return .child < self && self < .old
    }
    
    static func maxAge() -> BeingAge {
        return .old
    }
    
    static func < (lhs: BeingAge, rhs: BeingAge) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    mutating func incrimentAge() {
        if self < .dead {
            self = BeingAge(rawValue: self.rawValue + 1) ?? self
        }
    } 
}
