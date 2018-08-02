//
//  main.swift
//  BitNumbers
//
//  Created by Dima Manyahin on 8/1/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

func bitsString<T: BinaryInteger>(of number: T) -> String {
    return (0..<number.bitWidth).reduce("") { 
        (number >> $1 & 1).description + $0
    }
}

extension BinaryInteger {
    func bitsString() -> String {
        return BitNumbers.bitsString(of: self)
    }
}

func generalDescription<T: BinaryInteger>(of number: T, _ useExtension: Bool = false) -> String {
    return "\(type(of: number)) (\(number)) has next bits \(useExtension ? number.bitsString() : bitsString(of: number))"
}

print("--- Output with generic function ---")

print(generalDescription(of: 26))
print(generalDescription(of: -26))

print(generalDescription(of: Int64(26)))
print(generalDescription(of: Int64(-26)))

print(generalDescription(of: Int32(26)))
print(generalDescription(of: Int32(-26)))

print(generalDescription(of: Int16(26)))
print(generalDescription(of: Int16(-26)))

print(generalDescription(of: Int8(26)))
print(generalDescription(of: Int8(-26)))


print("\n--- Output with extension function ---")

print(generalDescription(of: 34, true))
print(generalDescription(of: -34, true))

print(generalDescription(of: Int64(34), true))
print(generalDescription(of: Int64(-34), true))

print(generalDescription(of: Int32(34), true))
print(generalDescription(of: Int32(-34), true))

print(generalDescription(of: Int16(34), true))
print(generalDescription(of: Int16(-34), true))

print(generalDescription(of: Int8(34), true))
print(generalDescription(of: Int8(-34), true))


