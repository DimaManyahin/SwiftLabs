//
//  BeingClass.swift
//  Being
//
//  Created by Dima Manyahin on 8/6/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

final class BeingClass : BeingProtocol {
    static var maxAge: UInt = 105
    var gender : BeingGender
    var name : String
    var age : UInt
    weak var mother : BeingClass?
    weak var father : BeingClass?
    var children : [BeingClass] = []
    
    required init(gender : BeingGender, name : String, age : UInt) {
        self.gender = gender;
        self.name = name
        self.age = age
        
        print("Init of <\(type(of: self)): 0x\(String(unsafeBitCast(self, to: Int.self), radix: 16, uppercase: false))>")
    }
    
    deinit {
        print("Deinit of <\(type(of: self)): 0x\(String(unsafeBitCast(self, to: Int.self), radix: 16, uppercase: false))>")
    }
}

extension CustomStringConvertible where Self : BeingClass {
    var description: String {
        return """
        \(type(of:self)) (0x\(String(unsafeBitCast(self, to: Int.self), radix: 16, uppercase: false)))
        has father(0x\(String(unsafeBitCast(self.father, to: Int.self), radix: 16, uppercase: false))) 
        has mother(0x\(String(unsafeBitCast(self.mother, to: Int.self), radix: 16, uppercase: false))) 
        has children count = \(self.children.count)
        """
    }
}

