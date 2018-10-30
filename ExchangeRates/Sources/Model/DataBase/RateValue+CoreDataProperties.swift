//
//  RateValue+CoreDataProperties.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData


extension RateValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RateValue> {
        return NSFetchRequest<RateValue>(entityName: "RateValue")
    }

    @NSManaged public var purchase: Double
    @NSManaged public var sale: Double
    @NSManaged public var exchanges: NSSet?

}

// MARK: Generated accessors for exchanges
extension RateValue {

    @objc(addExchangesObject:)
    @NSManaged public func addToExchanges(_ value: Exchange)

    @objc(removeExchangesObject:)
    @NSManaged public func removeFromExchanges(_ value: Exchange)

    @objc(addExchanges:)
    @NSManaged public func addToExchanges(_ values: NSSet)

    @objc(removeExchanges:)
    @NSManaged public func removeFromExchanges(_ values: NSSet)

}
