//
//  WelcomeScreenController.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/22/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class WelcomeScreenController: ControllerProtocol {
    
    var hasUnfinishedWork = true
    
    private static var count = 0
    func increaseTimeCounter() {
        WelcomeScreenController.count += 1
        self.hasUnfinishedWork = WelcomeScreenController.count < 10
    }

}
