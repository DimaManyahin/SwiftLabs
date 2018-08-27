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

typealias BeingCouple = (first: BeingProtocol, second: BeingProtocol)

struct BeingFactory {
    static var beingType = BeingType.asClass
    
    static func being(gender : BeingGender) -> BeingProtocol {
        if self.beingType == .asClass {
            return BeingClass(gender: gender)
        } else {
            return BeingStruct(gender: gender)
        }
    }
    
    static func beingChildren(from couple:BeingCouple) -> [BeingProtocol] {
        var result = [BeingProtocol]()
        if couple.first.gender != couple.second.gender {
            let probabilityOfBirth = [(1, 1), (2, 91), (92, 96), (97, 99), (100, 100)]
            let randNumber = (1...100).random
            var childrenCount = 0
            for ind in 0..<probabilityOfBirth.count {
                let (start, end) = probabilityOfBirth[ind]
                if start <= randNumber && randNumber <= end {
                    childrenCount = ind
                    break
                }
            }
            (0...childrenCount).forEach { _ in
                result.append(BeingFactory.being(gender: BeingGender.random()))
            }
        }
        return result
    }
}
