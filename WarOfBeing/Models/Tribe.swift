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
    var allBeing : [BeingProtocol] = []
    
    init(coupleCount: UInt) {
        (1...coupleCount).forEach { _ in
            self.allBeing.append(BeingFactory.being(gender: .male))
            self.allBeing.append(BeingFactory.being(gender: .female))
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
            0 < $0.age && $0.age < 4
        }
    }
    
    var allReproductiveMen : [BeingProtocol] {
        return self.allMen.filter { 
            0 < $0.age && $0.age < 4
        }
    }
    
}

extension CustomStringConvertible where Self : Tribe {
    
    var description: String {
        return "\(self.name) has \(self.allBeing.count) beings"
    }

}
