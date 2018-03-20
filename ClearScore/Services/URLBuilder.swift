//
//  URLBuilder.swift
//  ClearScore
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
class URLBuilder {
  let baseURL = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com"
  func applicationURL( ) -> URL? {
    return URL(string: baseURL)?
      .appendingPathComponent("prod")
      .appendingPathComponent("mockcredit")
      .appendingPathComponent("values")
  }
}
