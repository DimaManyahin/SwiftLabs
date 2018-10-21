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
    mutating func increasePower(delta: Double) {
        for i in 0..<self.units.count {
            self.units[i].damageForce += delta
        }
        
//        self.units[0].damageForce += delta
//        self.units = self.units.map({ being in
//            being.damageForce += delta
//            return being
//        })
    }
    
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
        return "Power of army=\(self.power) location=\(self.location) readinessToMove=\(self.readinessToMove)"
    }

}


