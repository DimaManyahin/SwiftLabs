//
//  main.swift
//  FizzBuzz
//
//  Created by Dima Manyahin on 7/25/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

func dividedBy3Description<T: FixedWidthInteger>(_ number: T) -> String {
    return number % 3 == 0 ? "Fizz" : ""
}

func dividedBy5Description<T: FixedWidthInteger>(_ number: T) -> String {
    return number % 5 == 0 ? "Buzz" : ""
}

func numberDescription<T: FixedWidthInteger>(_ number: T) -> String {
    let functions : Array<(T)->String> = [dividedBy3Description, dividedBy5Description]
    var result = ""
    
    for function in functions {
        result += function(number)
    }
    
    return result != "" ? result : String(number)
}

print(numberDescription(3))
print(numberDescription(5))
print(numberDescription(15))
print(numberDescription(4))

print(numberDescription(-3))
print(numberDescription(-5))
print(numberDescription(-15))
print(numberDescription(-4))
