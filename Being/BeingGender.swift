//
//  BeingGender.swift
//  Being
//
//  Created by Dima Manyahin on 8/2/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

enum BeingGender : Int, CustomStringConvertible {
    case male
    case female
    
    static func random() -> BeingGender {
        return BeingGender(rawValue: (male.rawValue ... female.rawValue).random) ?? .male
    }
    
    var description: String {
        var result : String
        switch self {
        case .male:
            result = "male"
        case .female:
            result = "female"
        }
        return result
    }
}
