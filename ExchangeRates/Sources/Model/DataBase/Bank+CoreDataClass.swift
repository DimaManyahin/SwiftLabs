//
//  Bank+CoreDataClass.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Bank)
public class Bank: NSManagedObject, CoreDataEntitiesProtocol {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: .bank), insertInto: CoreDataManager.instance.managedObjectContext)
    }

}

extension CoreDataManager.EntityName {
    static let bank = CoreDataManager.EntityName("Bank")
}
