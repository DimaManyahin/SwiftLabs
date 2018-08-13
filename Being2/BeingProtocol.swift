//
//  BeingProtocol.swift
//  Being2
//
//  Created by Dima Manyahin on 8/13/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

protocol BeingProtocol : CustomStringConvertible, Speaking, Living, Creating {
    static var maxAge : UInt {get}
    static var randomAge : UInt {get}
    
    var name : String {get set}
    var age : UInt {get set}
    
    var gender : BeingGender {get}
    
    init()
    init(name : String)
    init(gender : BeingGender, name : String, age : UInt)
}

extension BeingProtocol {
    static var randomAge : UInt {
        return (0...Self.maxAge).random
    }
    
    init() {
        self.init(gender: BeingGender.random(), name: NSUUID().uuidString, age: Self.randomAge)
    }
    
    init(name: String) {
        self.init(gender: BeingGender.random(), name: name, age: Self.randomAge)
    }
}

extension CustomStringConvertible where Self : BeingProtocol {
//    var description: String {
//        return "\(type(of:self)) with name=\(self.name), gender=\(self.gender), age=\(self.age)"
//    }
    var description: String {
        return """
        \(type(of:self)) 
        has father(\(self.father != nil ? "YES" : "NO")) 
        has mother(\(self.mother != nil ? "YES" : "NO")) 
        has children count = \(self.children.count)
        """
    }
}

extension Living where Self : BeingProtocol {
    var isLive : Bool {
        return self.age < Self.maxAge
    }
    
    mutating func growAge(_ offset: UInt) {
        if self.isLive {
            self.age += offset
        }
    }
}

extension Speaking where Self : BeingProtocol {
    func pronounceName() -> String {
        return self.isLive ? "My name is \(self.name)" : ""
    }
    
    func pronounceGender() -> String {
        return self.isLive ? "I am a \(self.gender)" : ""
    }
    
    func pronounceAge() -> String {
        return self.isLive ? "My age is \(self.age)" : ""
    }
}

extension Creating where Self : BeingProtocol {
    static func makeChild(father: inout Self, mother: inout Self) -> Self {
        var child = Self()
        child.father = father
        child.mother = mother
        father.children.append(child)
        mother.children.append(child)
        return child
    }
}

