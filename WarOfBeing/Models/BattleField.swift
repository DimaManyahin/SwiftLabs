//
//  BattleField.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 9/3/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class BattleField {
    struct BattleFieldSize {
        var roadCount : Int = 0
        var distanceBetweenTribes : Int = 0
    }
    
    var size = BattleFieldSize()
    
    var armyFormations : [ArmyFormation] = []
    
    var canMakeMoveOfArmies : Bool {
        var result = false
        armyFormationsLoop : for (advancingArmy, _) in self.armyFormations {
            for army in advancingArmy {
                if army.readinessToMove != .unavailable {
                    result = true
                    break armyFormationsLoop
                }
            }
        }
        return result
    }
    
    func makeMoveOfArmies() {
        if !self.canMakeMoveOfArmies {
            return
        }
        
        
        
        
    }
}
