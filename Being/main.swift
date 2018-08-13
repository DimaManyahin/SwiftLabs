//
//  main.swift
//  Being
//
//  Created by Dima Manyahin on 8/2/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

print("---------Random fill-----------")
(0..<10).forEach { _ in
    print(Bool.random() ? BeingStruct() : BeingClass())
}

print("---------Pronounce of struct-----------")

var being = BeingStruct()
print(being.pronounceName())
print(being.pronounceGender())
print(being.pronounceAge())

print("---------Pronounce of class-----------")

var beingClass = BeingClass()
beingClass.age = 50;
print(beingClass.pronounceName())
print(beingClass.pronounceGender())
print(beingClass.pronounceAge())
print("beingClass is \(beingClass.isLive ? "alive" : "dead")")

beingClass.growAge()
print("After default grow")
print(beingClass.pronounceAge())

beingClass.growAge(100)
print("100 years passed and try to speak")
print(beingClass.pronounceName())
print(beingClass.pronounceGender())
print(beingClass.pronounceAge())
print("beingClass is \(beingClass.isLive ? "alive" : "dead")")

