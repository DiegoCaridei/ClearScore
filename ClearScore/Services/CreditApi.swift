//
//  CreditApi.swift
//  ClearScore
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
import Alamofire
class CreditApi{
  private let urlBuilder = URLBuilder()
  static let shared = CreditApi()
  
  private init() { }
  private  func fetchCredit<T>(data :Data,completion: @escaping (DCResult<T>)->()){
    do {
      let credit = try Credit(data: data)
      guard let result  = DCResult.success(credit) as? DCResult<T> else {return}
      completion(result)
    }catch {
      completion(DCResult.failure(error))
    }
  }
  public func getCredit(completion: @escaping (DCResult<Credit>)->()) {
    request(completion: completion)
  }
  private func request <T> (completion: @escaping (DCResult<T>) -> ()){
    guard let url = urlBuilder.applicationURL() else {return}
    Alamofire.request(url, method: .get).validate().responseJSON { (response) in
      switch response.result {
      case .success(_):
        guard let data = response.data else {return}
        self.fetchCredit(data: data, completion: completion)
      case .failure(let error):
        completion(DCResult.failure(error))
      }
    }
  }
}

