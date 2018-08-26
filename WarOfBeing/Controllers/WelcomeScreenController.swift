//
//  WelcomeScreenController.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/22/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class WelcomeScreenController: ControllerProtocol {
    
    var hasUnfinishedWork : Bool {
        return self.messageIndex < self.messages.count
    }
    
    private var currentTimeCounter = 0
    private let messages = [
        "   Welcome",
        "        to",
        "\"War of being\"",
        ]
    private var messageIndex = 0

    func controllerDidAppear() {
        ConsoleView.shared.clearDisplay()
        self.showNextMessage()
    }
    
    func increaseTimeCounter() {
        self.currentTimeCounter += 1
        if self.currentTimeCounter % Application.app.globalTimeCounterPerSecond != 0 {
            return
        }
        self.showNextMessage()
    }

    private func showNextMessage() {
        if self.hasUnfinishedWork {
            ConsoleView.shared.display(message: self.messages[self.messageIndex], size:.big)
            self.messageIndex += 1
        }
    }
}
