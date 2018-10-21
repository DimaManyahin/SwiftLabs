//
//  JSONExchangeList.swift
//  ExchangeRates
//
//  Created by Dima Manyahin on 10/11/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

struct JSONExchangeList : Decodable {
    let date : String
    let bank : String
    let baseCurrency : Int
    let baseCurrencyLit : String
    let exchangeRate : [JSONExchangeRate]
}
