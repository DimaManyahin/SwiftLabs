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
}

extension CustomStringConvertible where Self : Tribe {
    
    var description: String {
        return "\(self.name) has \(self.allBeing.count) beings"
    }

}
