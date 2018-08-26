//
//  BeingFactory.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/26/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

enum BeingType {
    case asClass
    case asStruct
}

struct BeingFactory {
    static var beingType = BeingType.asClass
    
    static func being(gender : BeingGender) -> BeingProtocol {
        if self.beingType == .asClass {
            return BeingClass(gender: gender)
        } else {
            return BeingStruct(gender: gender)
        }
    }
}
