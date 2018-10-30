//
//  Exchange+CoreDataProperties.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData


extension Exchange {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exchange> {
        return NSFetchRequest<Exchange>(entityName: "Exchange")
    }

    @NSManaged public var currency: CurrencyDirection?
    @NSManaged public var exchangeList: NSSet?
    @NSManaged public var rate: RateValue?

}

// MARK: Generated accessors for exchangeList
extension Exchange {

    @objc(addExchangeListObject:)
    @NSManaged public func addToExchangeList(_ value: ConcreteExchange)

    @objc(removeExchangeListObject:)
    @NSManaged public func removeFromExchangeList(_ value: ConcreteExchange)

    @objc(addExchangeList:)
    @NSManaged public func addToExchangeList(_ values: NSSet)

    @objc(removeExchangeList:)
    @NSManaged public func removeFromExchangeList(_ values: NSSet)

}
