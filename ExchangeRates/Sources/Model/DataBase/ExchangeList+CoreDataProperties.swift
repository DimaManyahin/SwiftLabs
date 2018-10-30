//
//  ExchangeList+CoreDataProperties.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData


extension ExchangeList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExchangeList> {
        return NSFetchRequest<ExchangeList>(entityName: "ExchangeList")
    }

    @NSManaged public var bank: Bank?
    @NSManaged public var concreteExchange: ConcreteExchange?

}
