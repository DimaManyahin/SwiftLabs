//
//  JSONExchangeRate.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/11/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

struct JSONExchangeRate : Decodable {
    let baseCurrency : String
    let currency : String
    let saleRateNB : Double
    let purchaseRateNB : Double
    let saleRate : Double?
    let purchaseRate : Double?
}
