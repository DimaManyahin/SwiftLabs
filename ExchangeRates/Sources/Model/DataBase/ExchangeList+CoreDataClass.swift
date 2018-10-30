//
//  ExchangeList+CoreDataClass.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ExchangeList)
public class ExchangeList: NSManagedObject, CoreDataEntitiesProtocol {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: .exchangeList), insertInto: CoreDataManager.instance.managedObjectContext)
    }

}

extension CoreDataManager.EntityName {
    static let exchangeList = CoreDataManager.EntityName("ExchangeList")
}
