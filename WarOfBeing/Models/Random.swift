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

extension IndexSet {
    var random: IndexSet.RangeView.Index? {
        guard let first = self.first else {
            return nil
        }
        guard let last = self.last else {
            return nil
        }
        var result = (first...last).random
        if let index1 = self.integerGreaterThanOrEqualTo(result) {
            result = index1
        } else if let index2 = self.integerLessThanOrEqualTo(result) {
            result = index2
        }
        return result
    }
}


