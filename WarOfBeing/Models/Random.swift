//
//  Random.swift
//  Being
//
//  Created by Dima Manyahin on 8/6/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

extension Range where Bound : FixedWidthInteger {
    var random: Bound {
        return lowerBound + Bound(arc4random_uniform(UInt32(upperBound - lowerBound)))
    }
}

extension ClosedRange where Bound : FixedWidthInteger{
    var random: Bound {
        return lowerBound + Bound(arc4random_uniform(UInt32(upperBound - lowerBound + 1)))
    }
}

func random<T: FixedWidthInteger>(in range:Range<T>) -> T {
    return range.random
}

func random<T: FixedWidthInteger>(in range:ClosedRange<T>) -> T {
    return range.random
}

extension Bool {
    static func random() -> Bool {
        return WarOfBeing.random(in: 0..<100) % 2 == 0
    }
}
