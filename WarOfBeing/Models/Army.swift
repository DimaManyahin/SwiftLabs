//
//  Army.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 9/3/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

typealias ArmyFormation = (advancingArmy: [Army], defenceArmy: Army)

enum ReadinessToMove : Equatable {
    case unavailable
    case ready    
    case readyAfter(Int)
    
    static func generateReadyState() -> ReadinessToMove {
        var result : ReadinessToMove
        let count = (0...3).random
        switch count {
        case 0:
            result = .ready
        default:
            result = .readyAfter(count)
        }
        return result
    }
    
    mutating func improveReadinessForMovement() {
        switch self {
        case .readyAfter(1):
            self = .ready
        case let .readyAfter(count):
            self = .readyAfter(count - 1)
        default:
            break
        }
    }
}

func ==(lhs: ReadinessToMove, rhs: ReadinessToMove) -> Bool {
    switch (lhs, rhs) {
    case (let .readyAfter(countL), let .readyAfter(countR)):
        return countL == countR
    case (.unavailable, .unavailable):
        return true
    case (.ready, .ready):
        return true
    default:
        return false
    }
}

struct Army : CustomStringConvertible {
    var units : [BeingProtocol] = []
    var power : Double {
        return self.units.reduce(0) {
            $0 + $1.damageForce
        }
    }
    var location = BattleFieldLocation()
    var readinessToMove : ReadinessToMove = .unavailable
    
//    mutating func makeMoveIfPossible() {
//        switch self.readinessToMove {
//        case .ready:
//            
//            
//            
//            
//            self.location.makeMoveForward()
//        case .readyAfter(_):
//            self.readinessToMove.improveReadinessForMovement()
//        default:
//            break
//        }
//    }
    
    
    var description: String {
        
//        return "\(self.name) has \(self.allBeing.count) beings"
        return ""
    }

}


