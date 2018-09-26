//
//  Tribe.swift
//  WarOrBeing
//
//  Created by Dima Manyahin on 8/22/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class Tribe : CustomStringConvertible {
    
    var name = ""
    private(set) var allBeing : [BeingProtocol] = []
    
    init(coupleCount: UInt) {
        (1...coupleCount).forEach { _ in
            var being = BeingFactory.being(gender: .male)
            being.tribe = self
            being.growAge()
            self.allBeing.append(being)
            
            being = BeingFactory.being(gender: .female)
            being.tribe = self
            being.growAge()
            self.allBeing.append(being)
        }
    }
    
    var allWomen : [BeingProtocol] {
        return self.allBeing.filter { 
            $0.gender == .female
        }
    }

    var allMen : [BeingProtocol] {
        return self.allBeing.filter { 
            $0.gender == .male
        }
    }

    var allReproductiveWomen : [BeingProtocol] {
        return self.allWomen.filter { 
            $0.age.isReproductive()
        }
    }
    
    var allReproductiveMen : [BeingProtocol] {
        return self.allMen.filter { 
            $0.age.isReproductive()
        }
    }
    
    func accept(children: [BeingProtocol]) {
        children.forEach { being in
            var child = being
            if child.age == .child && (child.tribe !== self) {
                child.tribe = self
                self.allBeing.append(child)
            }
        }
    }
    
    func generateArmy(for roadCount: Int) -> ArmyFormation {
        var allWarriors = self.allReproductiveMen
        var countOfDefenceWarriors = Int(Double(allWarriors.count) * 0.2)
        var defenceArmy = Army()
        while countOfDefenceWarriors > 0 {
            let index = (0..<allWarriors.count).random
            defenceArmy.units.append(allWarriors[index])
            allWarriors.remove(at: index)
            countOfDefenceWarriors -= 1
            defenceArmy.location.location = .home
        }
        
        var result : [Army] = [] 
        if allWarriors.count > roadCount {
            var roadIndexes = IndexSet(integersIn: 0..<roadCount)
            while roadIndexes.count > 0 {
                guard let index = roadIndexes.random else {
                    continue
                }
                roadIndexes.remove(index)

                let unit = allWarriors.remove(at: result.count)
                var army = Army()
                army.units.append(unit)
                army.location.location = .road(index)
                army.readinessToMove = .generateReadyState()
                result.append(army)
            }
            
            roadIndexes = IndexSet(integersIn: 0..<roadCount)
            allWarriors.forEach { unit in
                guard let index = roadIndexes.random else {
                    return
                }

                result[index].units.append(unit)
            }
        } else {
            var roadIndexes = IndexSet(integersIn: 0..<roadCount)
            allWarriors.forEach { unit in
                guard let index = roadIndexes.random else {
                    return
                }
                roadIndexes.remove(index)

                var army = Army()
                army.units.append(unit)
                army.location.location = .road(index)
                army.readinessToMove = .generateReadyState()
                result.append(army)
            }
        }
        
        return (result, defenceArmy)
    }
}

extension CustomStringConvertible where Self : Tribe {
    
    var description: String {
        return "\(self.name) has \(self.allBeing.count) beings"
    }

}
