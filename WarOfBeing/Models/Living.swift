//
//  Living.swift
//  Being2
//
//  Created by Dima Manyahin on 8/13/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

protocol Living {
    var isLive : Bool {get}
    mutating func growAge()
    mutating func growAge(_ offset: UInt)
}

extension Living {
    mutating func growAge() {
        self.growAge(1)
    }
}
