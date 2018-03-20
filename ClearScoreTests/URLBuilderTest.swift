
//
//  URLBuilderTest.swift
//  ClearScoreTests
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import XCTest
@testable import ClearScore
class URLBuilderTest: XCTestCase {
  var urlBulilder:URLBuilder!
  
  override func setUp() {
    super.setUp()
    urlBulilder = URLBuilder()
  }
  override func tearDown() {
    urlBulilder = nil
    super.tearDown()
  }
  func testApplicationURL(){
    guard let url = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")else {return}
    XCTAssertEqual(urlBulilder.applicationURL(), url)
  }
  func testBaseURL(){
    XCTAssertEqual(urlBulilder.baseURL, "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com")
  }
}
