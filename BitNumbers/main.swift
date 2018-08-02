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

func generalDescription1<T: BinaryInteger>(of number: T) -> String {
    return "\(type(of: number)) (\(number)) has next bits \(bitsString(of: number))"
}

func generalDescription2<T: BinaryInteger>(of number: T) -> String {
    return "\(type(of: number)) (\(number)) has next bits \(number.bitsString())"
}


print("--- Output with generic function ---")

print(generalDescription1(of: 26))
print(generalDescription1(of: -26))

print(generalDescription1(of: Int64(26)))
print(generalDescription1(of: Int64(-26)))

print(generalDescription1(of: Int32(26)))
print(generalDescription1(of: Int32(-26)))

print(generalDescription1(of: Int16(26)))
print(generalDescription1(of: Int16(-26)))

print(generalDescription1(of: Int8(26)))
print(generalDescription1(of: Int8(-26)))


print("\n--- Output with extension function ---")

print(generalDescription2(of: 34))
print(generalDescription2(of: -34))

print(generalDescription2(of: Int64(34)))
print(generalDescription2(of: Int64(-34)))

print(generalDescription2(of: Int32(34)))
print(generalDescription2(of: Int32(-34)))

print(generalDescription2(of: Int16(34)))
print(generalDescription2(of: Int16(-34)))

print(generalDescription2(of: Int8(34)))
print(generalDescription2(of: Int8(-34)))


