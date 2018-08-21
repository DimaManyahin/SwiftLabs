//
//  Application.swift
//  WarOrBeing
//
//  Created by Dima Manyahin on 8/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class Application {
    static let `app` = Application()
    lazy var appDelegate = AppDelegate()
    
    private init() {}
    private var appTimer : Timer?
    private var shouldContinueExecution = true    
    
    func run() -> Int32 {
        self.appDelegate.applicationDidFinishLaunching()
        setupAndRunTimer()
        startRunLoop()
        return 0
    }
    
    private func setupAndRunTimer() {
        self.appTimer = Timer(timeInterval: 0.5, repeats: true, block: { [unowned self] _ in
            if self.shouldContinueExecution {
                self.appDelegate.globalTimeCounterIncreased()
                self.shouldContinueExecution = !self.appDelegate.shouldApplicationStopExecution()
            }
        }) 
        if let timer = self.appTimer {
            let runLoop = RunLoop.current
            runLoop.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }

    private func startRunLoop() {
        let runLoop = RunLoop.current
        var runResult = true
        repeat {
            autoreleasepool { 
                let timeToWaite = Date(timeIntervalSinceNow: 1)
                runResult = runLoop.run(mode:.defaultRunLoopMode, before:timeToWaite)
            }
        } while (self.shouldContinueExecution && runResult)
    }
}
