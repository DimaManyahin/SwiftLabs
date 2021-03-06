//
//  BeingStruct.swift
//  Being
//
//  Created by Dima Manyahin on 8/2/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

struct BeingStruct : BeingProtocol {
    var gender : BeingGender
    var name : String
    var age : UInt
    static var maxAge: UInt = 100

    init(gender : BeingGender, name : String, age : UInt) {
        self.gender = gender;
        self.name = name
        self.age = age
    }
}
