//
//  BeingProtocol.swift
//  Being2
//
//  Created by Dima Manyahin on 8/13/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

protocol BeingProtocol : CustomStringConvertible, Speaking, Living, Creating, WarriorProtocol {
    var name : String {get set}
    var age : BeingAge {get set}
    var tribe : Tribe?  {get set}
    
    var gender : BeingGender {get}
    
    init(gender : BeingGender)
    init(gender : BeingGender, name : String, age : BeingAge)
}

extension BeingProtocol {
    init(gender : BeingGender) {
        self.init(gender: gender, name: NSUUID().uuidString, age: .child)
    }
}

extension CustomStringConvertible where Self : BeingProtocol {
    var description: String {
        return "\(type(of:self)) with name=\(self.name), gender=\(self.gender), age=\(self.age)"
    }
//    var description: String {
//        return """
//        \(type(of:self)) 
//        has father(\(self.father != nil ? "YES" : "NO")) 
//        has mother(\(self.mother != nil ? "YES" : "NO")) 
//        has children count = \(self.children.count)
//        """
//    }
}

extension Living where Self : BeingProtocol {
    var isLive : Bool {
        return self.age < BeingAge.maxAge()
    }
    
    mutating func growAge() {
        if self.isLive {
            self.age.incrimentAge()
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

//extension Creating where Self : BeingProtocol {
//    static func makeChild(father: inout Self, mother: inout Self) -> Self {
//        var child = Self()
//        child.father = father
//        child.mother = mother
//        father.children.append(child)
//        mother.children.append(child)
//        return child
//    }
//}

