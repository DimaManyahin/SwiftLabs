//
//  LifeCicle.swift
//  Being
//
//  Created by Dima Manyahin on 8/6/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

protocol LifeCicle {
    var isLive : Bool {get}
    mutating func growAge()
    mutating func growAge(_ offset: UInt)
}

extension LifeCicle {
    mutating func growAge() {
        self.growAge(1)
    }
}
