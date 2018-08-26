//
//  AppDelegate.swift
//  WarOrBeing
//
//  Created by Dima Manyahin on 8/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class AppDelegate {
    
    private var currentController : ControllerProtocol?
    
    func applicationDidFinishLaunching () {
//        print("applicationDidFinishLaunching")
        
//        self.currentController = WelcomeScreenController()
        self.currentController = GameController()
        self.currentController?.controllerDidAppear()
        
    }
    
    func globalTimeCounterIncreased() {
//        print("globalTimeCounterIncreased")
        guard let controller = self.currentController else {
            return
        }
        if controller.hasUnfinishedWork == false {
            self.switchToNextController()
        }

        controller.increaseTimeCounter()
    }
    
    func shouldApplicationStopExecution() -> Bool {
//        print("shouldApplicationStopExecution")
        
        return self.currentController == nil
    }
    
    private func switchToNextController() {
        if let controller = self.currentController, controller is WelcomeScreenController {
            self.currentController = GameController()
            self.currentController?.controllerDidAppear()
        } else {
            self.currentController = nil
        }
    }
}
