//
//  GameController.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/26/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

class GameController: ControllerProtocol {
    
    private enum GameState {
        case initial
        case truce
        case beginOfWar
        case war
        case endOfWar
        case endOfGame
    }
    
    private var currentState = GameState.initial
    var tribes : [Tribe] = []
    
    var hasUnfinishedWork : Bool {
        return self.currentState != .endOfGame
    }

    func controllerDidAppear() {
        ConsoleView.shared.clearDisplay()
        self.makeInitialSetup()
    }
    
    func increaseTimeCounter() {
        switch self.currentState {
        case .truce:
            self.makeTruceStage()
        case .beginOfWar:
            self.makeBiginOfWar()
        case .war:
            self.makeWar()
        case .endOfWar:
            self.makeEndOfWar()
//        case .endOfGame:
//            self.makeBiginOfWar()
        default:
            break
        }
    }
    
    func makeInitialSetup() {
        ConsoleView.shared.display(message: "")
        var tribe = self.createTribe()
        tribe.name = "Tribe 1"
        self.tribes.append(tribe)
        
        tribe = self.createTribe()
        tribe.name = "Tribe 2"
        self.tribes.append(tribe)
        
        self.tribes.forEach { 
            ConsoleView.shared.display(message: $0.description)
        }

        self.currentState = .truce
    }
    
    func createTribe() -> Tribe {
        return Tribe(coupleCount: 10)
    }
    
    func makeTruceStage() {
        func makeCouples(inside tribe: Tribe) -> [BeingCouple] {
            var result = [BeingCouple]()
            var allReproductiveWomen = tribe.allReproductiveWomen
            var allReproductiveMen = tribe.allReproductiveMen
            for ind in 0..<(allReproductiveMen.count < allReproductiveWomen.count ? allReproductiveMen.count : allReproductiveWomen.count) {
                result.append((allReproductiveMen[ind], allReproductiveWomen[ind]))
            }
            return result
        }
        func makeChildren(from couples: [BeingCouple]) -> [BeingProtocol] {
            var result = [BeingProtocol]()
            couples.forEach { couple in
                result += BeingFactory.beingChildren(from: couple)
            }
            return result
        }
        self.tribes.forEach { tribe in
            let children = makeChildren(from: makeCouples(inside: tribe))
            tribe.accept(children: children)
        }
        self.currentState = .beginOfWar
    }
    
    func makeBiginOfWar() {
        
    }

    func makeWar() {
        
    }

    func makeEndOfWar() {
        
    }
}
