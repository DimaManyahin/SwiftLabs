//
//  BattleFieldLocation.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 9/3/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

enum LocationType {
    case home
    case foreignLand
    case road(Int)
}

struct BattleFieldLocation {
    var location : LocationType = .home
    var distanceFromHome : Int = 0
}
