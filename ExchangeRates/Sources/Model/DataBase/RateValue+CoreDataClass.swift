//
//  RateValue+CoreDataClass.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(RateValue)
public class RateValue: NSManagedObject, CoreDataEntitiesProtocol {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: .rateValue), insertInto: CoreDataManager.instance.managedObjectContext)
    }
    
}

extension CoreDataManager.EntityName {
    static let rateValue = CoreDataManager.EntityName("RateValue")
}
