//
//  CurrencyDirection+CoreDataProperties.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData


extension CurrencyDirection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrencyDirection> {
        return NSFetchRequest<CurrencyDirection>(entityName: "CurrencyDirection")
    }

    @NSManaged public var base: String?
    @NSManaged public var currency: String?
    @NSManaged public var exchanges: NSSet?

}

// MARK: Generated accessors for exchanges
extension CurrencyDirection {

    @objc(addExchangesObject:)
    @NSManaged public func addToExchanges(_ value: Exchange)

    @objc(removeExchangesObject:)
    @NSManaged public func removeFromExchanges(_ value: Exchange)

    @objc(addExchanges:)
    @NSManaged public func addToExchanges(_ values: NSSet)

    @objc(removeExchanges:)
    @NSManaged public func removeFromExchanges(_ values: NSSet)

}
