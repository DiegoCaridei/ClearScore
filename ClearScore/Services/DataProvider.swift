//
//  DataProvider.swift
//  ClearScore
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
class DataProvider {
  static func fetchCredit(completition:@escaping((CreditViewModel) -> Void)) {
    CreditApi.shared.getCredit { (result) in
      switch result {
      case .success(let credit):
        completition(CreditViewModel(credit: credit))
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
