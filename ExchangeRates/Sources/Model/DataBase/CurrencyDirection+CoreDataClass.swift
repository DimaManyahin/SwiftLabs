//
//  CurrencyDirection+CoreDataClass.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CurrencyDirection)
public class CurrencyDirection: NSManagedObject, CoreDataEntitiesProtocol {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: .currencyDirection), insertInto: CoreDataManager.instance.managedObjectContext)
    }
    
}

extension CoreDataManager.EntityName {
    static let currencyDirection = CoreDataManager.EntityName("CurrencyDirection")
}
