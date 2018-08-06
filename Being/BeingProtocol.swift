//
//  BeingProtocol.swift
//  Being
//
//  Created by Dima Manyahin on 8/6/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

protocol BeingProtocol : CustomStringConvertible, Speak, LifeCicle {
    var gender : BeingGender {get}
    var name : String {get set}
    var age : UInt {get set}
    static var maxAge : UInt {get}
    static var randomAge : UInt {get}

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

extension BeingProtocol where Self : CustomStringConvertible {
    var description: String {
        return "\(type(of:self)) with name=\(self.name), gender=\(self.gender), age=\(self.age)"
    }
}

extension BeingProtocol where Self : LifeCicle {
    var isLive : Bool {
        return self.age < Self.maxAge
    }
    
    mutating func growAge(_ offset: UInt) {
        if self.isLive {
            self.age += offset
        }
    }
}

extension BeingProtocol where Self : Speak, Self : LifeCicle{
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
