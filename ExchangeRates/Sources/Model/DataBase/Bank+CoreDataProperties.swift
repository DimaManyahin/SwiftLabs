//
//  Bank+CoreDataProperties.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/21/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//
//

import Foundation
import CoreData


extension Bank {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bank> {
        return NSFetchRequest<Bank>(entityName: "Bank")
    }

    @NSManaged public var name: String?
    @NSManaged public var exchangeList: NSSet?

}

// MARK: Generated accessors for exchangeList
extension Bank {

    @objc(addExchangeListObject:)
    @NSManaged public func addToExchangeList(_ value: ExchangeList)

    @objc(removeExchangeListObject:)
    @NSManaged public func removeFromExchangeList(_ value: ExchangeList)

    @objc(addExchangeList:)
    @NSManaged public func addToExchangeList(_ values: NSSet)

    @objc(removeExchangeList:)
    @NSManaged public func removeFromExchangeList(_ values: NSSet)

}
