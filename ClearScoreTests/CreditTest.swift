//
//  CreditTest.swift
//  ClearScoreTests
//
//  Created by Diego Caridei on 27/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import XCTest
@testable import ClearScore
class CreditTest: XCTestCase {
    var credit: Credit!
    var creditViewModel: CreditViewModel!
    var data: Data!
    override func setUp() {
        initCredit()
        super.setUp()
    }
    override func tearDown() {
        credit = nil
        data = nil
        creditViewModel = nil
        super.tearDown()
    }
    func testModelScoreIsEqualToViewModelScore() {
        XCTAssertEqual(creditViewModel.yourScore, credit.creditReportInfo.score)
    }
    func testCreditViewModelMaxValue() {
        XCTAssertEqual(creditViewModel.maxScore, 700)
    }
    func testCreditViewModelNotNil() {
        XCTAssertNotNil(creditViewModel)
    }
    func testMaxValueModel() {
        XCTAssertEqual(credit.creditReportInfo.maxScoreValue, 700)
    }
    func testCreditModelNotNil() {
        XCTAssertNotNil(credit)
    }
    func initCredit() {
        if let path = Bundle.main.path(forResource: "datasourse", ofType: "json") {
            if let  jsonString = try? String(contentsOfFile: path) {
                data = jsonString.data(using: String.Encoding.utf8)
                if let  creditFromFile = try? Credit(data: data) {
                    credit = creditFromFile
                    creditViewModel = CreditViewModel(credit: credit)
                }
            }
        }
    }
}
