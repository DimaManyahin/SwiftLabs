//
//  ConcreteExchange+CoreDataProperties.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData


extension ConcreteExchange {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ConcreteExchange> {
        return NSFetchRequest<ConcreteExchange>(entityName: "ConcreteExchange")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var exchange: Exchange?
    @NSManaged public var exchangeList: NSSet?

}

// MARK: Generated accessors for exchangeList
extension ConcreteExchange {

    @objc(addExchangeListObject:)
    @NSManaged public func addToExchangeList(_ value: ExchangeList)

    @objc(removeExchangeListObject:)
    @NSManaged public func removeFromExchangeList(_ value: ExchangeList)

    @objc(addExchangeList:)
    @NSManaged public func addToExchangeList(_ values: NSSet)

    @objc(removeExchangeList:)
    @NSManaged public func removeFromExchangeList(_ values: NSSet)

}
