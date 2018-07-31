//
//  main.swift
//  FizzBuzz
//
//  Created by Dima Manyahin on 7/25/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

extension FixedWidthInteger {
    
    fileprivate func dividedBy3Description() -> String {
        return self % 3 == 0 ? "Fizz" : ""
    }
    
    fileprivate func dividedBy5Description() -> String {
        return self % 5 == 0 ? "Buzz" : ""
    }
    
    public var symbolicDescription: String {
        let result = [dividedBy3Description, dividedBy5Description].reduce("") { 
            $0 + $1()
        }

        return result != "" ? result : String(self)
    }

}

print(3.symbolicDescription)
print(5.symbolicDescription)
print(15.symbolicDescription)
print(4.symbolicDescription)

print((-3).symbolicDescription)
print((-5).symbolicDescription)
print((-15).symbolicDescription)
print((-4).symbolicDescription)

