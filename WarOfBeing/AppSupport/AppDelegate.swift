//
//  AppDelegate.swift
//  WarOrBeing
//
//  Created by Dima Manyahin on 8/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class AppDelegate {
    
    var currentController : ControllerProtocol?
    
    func applicationDidFinishLaunching () {
        print("applicationDidFinishLaunching")
        
        self.currentController = WelcomeScreenController()
        
        
        
    }
    
    func globalTimeCounterIncreased() {
        print("globalTimeCounterIncreased")
        guard let controller = self.currentController else {
            return
        }

        controller.increaseTimeCounter()
        if controller.hasUnfinishedWork == false {
            self.currentController = nil
        }
    }
    
    func shouldApplicationStopExecution() -> Bool {
        print("shouldApplicationStopExecution")
        
        return self.currentController == nil
    }
}
