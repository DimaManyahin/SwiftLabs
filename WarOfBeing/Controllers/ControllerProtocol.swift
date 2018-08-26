//
//  ControllerProtocol.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/22/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

protocol ControllerProtocol : class {
    var hasUnfinishedWork : Bool {get}
    
    func controllerDidAppear()
    func increaseTimeCounter()
}
