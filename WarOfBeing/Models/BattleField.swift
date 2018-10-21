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
        
        self.increaseExperienceOfArmys()
        
        
    }
    
    func increaseExperienceOfArmys() {
        for i in 0..<self.armyFormations.count {
            var (advancingArmy, defenceArmy) = self.armyFormations[i]
            defenceArmy.increasePower(delta: 1.2)
            for j in 0..<advancingArmy.count {
                var army = advancingArmy[j]
                if army.readinessToMove == .ready {
                    army.increasePower(delta: 1)
                    advancingArmy[j] = army
                }
            }
            self.armyFormations[i] = (advancingArmy, defenceArmy)
        }
    }
}
