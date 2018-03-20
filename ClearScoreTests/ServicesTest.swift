//
//  ServicesTest.swift
//  ClearScoreTests
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs
@testable import ClearScore
class ServicesTest: XCTestCase {
  var sessionManager: SessionManager!
  var urlBuilder: URLBuilder!
  
  override func setUp() {
    super.setUp()
    setupStub()
    setupSessionManager()
    urlBuilder = URLBuilder()
  }
  
  override func tearDown() {
    sessionManager = nil
    urlBuilder = nil
    OHHTTPStubs.removeAllStubs()
    super.tearDown()
  }
  func setupStub(){
    stub(condition: isHost("5lfoiyb0b3.execute-api.us-west-2.amazonaws.com")) { request -> OHHTTPStubsResponse in
      var stubData = Data()
      if let path = Bundle.main.path(forResource: "datasourse", ofType: "json") {
        if let  jsonString = try? String(contentsOfFile: path) {
          stubData = jsonString.data(using: String.Encoding.utf8)!
        }
      }
      return OHHTTPStubsResponse(data:stubData, statusCode:200, headers: ["Content-Type":"application/json"])
    }
  }
  func setupSessionManager(){
    let configuration = URLSessionConfiguration.default
    OHHTTPStubs.setEnabled(true, for: configuration)
    configuration.urlCache = nil
    sessionManager = SessionManager(configuration: configuration)
  }
  func testOHHTTPStubs()  {
    let expectation0 = self.expectation(description: "alamonfire")
    guard let url = urlBuilder.applicationURL() else {return}
    sessionManager.request(url, method: .get).validate().responseJSON { (response) in
      switch response.result {
      case .success(_):
        guard let data = response.data else {
          XCTFail()
          return
        }
        let credit = try! Credit(data:data)
        let creditViewModel = CreditViewModel(credit: credit)
        XCTAssertEqual(creditViewModel.maxScore, credit.creditReportInfo.maxScoreValue)
        expectation0.fulfill()
      case .failure(_):
        XCTFail()
      }
    }
    XCTWaiter().wait(for: [expectation0], timeout: 3)
  }
}

