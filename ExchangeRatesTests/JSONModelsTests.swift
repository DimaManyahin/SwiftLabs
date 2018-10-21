//
//  JSONModelsTests.swift
//  JSONModelsTests
//
//  Created by Dima Manyahin on 10/11/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import XCTest

class JSONModelsTests: XCTestCase {
    
    private var session : URLSession {
        return URLSession.shared
    }
    
    private var defaultUrl : URL {
        return URL.init(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=01.12.2014")!
    }
    
    private var dataTask : URLSessionDataTask?
    private var jsonData : Data?
    private var responseError : Error?
    
    // MARK: - Overriden

    override func setUp() {
        super.setUp()
        self.downloadJSONData()
    }
    
    override func tearDown() {
        self.dataTask = nil
        self.jsonData = nil
        self.responseError = nil
        super.tearDown()
    }
    
    // MARK: - Private
    
    private func downloadJSONData() {
        self.dataTask = self.session.dataTask(with: self.defaultUrl) {[unowned self] data, response, error in 
            defer { self.dataTask = nil }
            
            self.responseError = error
            guard error == nil else {
                return
            }
            
            self.jsonData = data
        }
        
        self.dataTask?.resume()
        self.waitUntilGetUrlResponse()

    }    
    
    private func waitUntilGetUrlResponse() {
        autoreleasepool {
            while self.dataTask != nil {
                RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.1))
            }
        }
    }

    // MARK: - Unit tests
    
    func testDecodingJSONDataToModels() {
        XCTAssertNil(self.responseError)
        XCTAssertNotNil(self.jsonData)
        guard let data = self.jsonData else {
            return
        }
        
        guard let exchangeList = try? JSONDecoder().decode(JSONExchangeList.self, from: data) else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(exchangeList.date, "01.12.2014")
        XCTAssertEqual(exchangeList.bank, "PB")
        XCTAssertEqual(exchangeList.baseCurrency, 980)
        XCTAssertEqual(exchangeList.baseCurrencyLit, "UAH")
        XCTAssertEqual(exchangeList.exchangeRate.count, 20)

        let currencies = ["AUD", "CAD", "CZK", "DKK", "HUF", "ILS", "JPY", "LVL", "LTL", "NOK",
                          "SKK", "SEK", "CHF", "RUB", "GBP", "USD", "BYR", "EUR", "GEL", "PLZ"]

        for i in 0..<exchangeList.exchangeRate.count {
            let JSONRate = exchangeList.exchangeRate[i]
            XCTAssertEqual(JSONRate.baseCurrency, "UAH")
            XCTAssertEqual(JSONRate.currency, currencies[i])
        }
    }
    
}
