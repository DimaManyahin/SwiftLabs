//
//  BeingStruct.swift
//  Being
//
//  Created by Dima Manyahin on 8/2/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

struct BeingStruct : BeingProtocol {
    
    static var maxAge: UInt = 100
    var gender : BeingGender
    var name : String
    var age : UInt
    
    class Container {
        var content : BeingStruct?
        
        init() {
            print("Init of <\(type(of: self)): 0x\(String(unsafeBitCast(self, to: Int.self), radix: 16, uppercase: false))>")
        }
        
        deinit {
            print("Deinit of <\(type(of: self)): 0x\(String(unsafeBitCast(self, to: Int.self), radix: 16, uppercase: false))>")
        }
    }
    
    private var _mother = Container()
    var mother : BeingStruct? {
        get {
            return _mother.content
        }
        set {
            _mother.content = newValue
        }
    }

    private var _father = Container()
    var father : BeingStruct? {
        get {
            return _father.content
        }
        set {
            _father.content = newValue
        }
    }

    var children : [BeingStruct] = []

    init(gender : BeingGender, name : String, age : UInt) {
        self.gender = gender;
        self.name = name
        self.age = age
    }
}
