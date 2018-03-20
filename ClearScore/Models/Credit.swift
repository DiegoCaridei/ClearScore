//
//  Credit.swift
//  ClearScore
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
class Credit: Codable {
  let accountIDVStatus: String
  let creditReportInfo: CreditReportInfo
  let dashboardStatus, personaType: String
  let coachingSummary: CoachingSummary
  let augmentedCreditScore: JSONNull?
  
  init(accountIDVStatus: String, creditReportInfo: CreditReportInfo, dashboardStatus: String, personaType: String, coachingSummary: CoachingSummary, augmentedCreditScore: JSONNull?) {
    self.accountIDVStatus = accountIDVStatus
    self.creditReportInfo = creditReportInfo
    self.dashboardStatus = dashboardStatus
    self.personaType = personaType
    self.coachingSummary = coachingSummary
    self.augmentedCreditScore = augmentedCreditScore
  }
}

class CoachingSummary: Codable {
  let activeTodo, activeChat: Bool
  let numberOfTodoItems, numberOfCompletedTodoItems: Int
  let selected: Bool
  
  init(activeTodo: Bool, activeChat: Bool, numberOfTodoItems: Int, numberOfCompletedTodoItems: Int, selected: Bool) {
    self.activeTodo = activeTodo
    self.activeChat = activeChat
    self.numberOfTodoItems = numberOfTodoItems
    self.numberOfCompletedTodoItems = numberOfCompletedTodoItems
    self.selected = selected
  }
}

class CreditReportInfo: Codable {
  let score, scoreBand: Int
  let clientRef, status: String
  let maxScoreValue, minScoreValue, monthsSinceLastDefaulted: Int
  let hasEverDefaulted: Bool
  let monthsSinceLastDelinquent: Int
  let hasEverBeenDelinquent: Bool
  let percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt: Int
  let currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt: Int
  let currentLongTermDebt, currentLongTermNonPromotionalDebt: Int
  let currentLongTermCreditLimit, currentLongTermCreditUtilisation: JSONNull?
  let changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand: Int
  let equifaxScoreBandDescription: String
  let daysUntilNextReport: Int
  
  init(score: Int, scoreBand: Int, clientRef: String, status: String, maxScoreValue: Int, minScoreValue: Int, monthsSinceLastDefaulted: Int, hasEverDefaulted: Bool, monthsSinceLastDelinquent: Int, hasEverBeenDelinquent: Bool, percentageCreditUsed: Int, percentageCreditUsedDirectionFlag: Int, changedScore: Int, currentShortTermDebt: Int, currentShortTermNonPromotionalDebt: Int, currentShortTermCreditLimit: Int, currentShortTermCreditUtilisation: Int, changeInShortTermDebt: Int, currentLongTermDebt: Int, currentLongTermNonPromotionalDebt: Int, currentLongTermCreditLimit: JSONNull?, currentLongTermCreditUtilisation: JSONNull?, changeInLongTermDebt: Int, numPositiveScoreFactors: Int, numNegativeScoreFactors: Int, equifaxScoreBand: Int, equifaxScoreBandDescription: String, daysUntilNextReport: Int) {
    self.score = score
    self.scoreBand = scoreBand
    self.clientRef = clientRef
    self.status = status
    self.maxScoreValue = maxScoreValue
    self.minScoreValue = minScoreValue
    self.monthsSinceLastDefaulted = monthsSinceLastDefaulted
    self.hasEverDefaulted = hasEverDefaulted
    self.monthsSinceLastDelinquent = monthsSinceLastDelinquent
    self.hasEverBeenDelinquent = hasEverBeenDelinquent
    self.percentageCreditUsed = percentageCreditUsed
    self.percentageCreditUsedDirectionFlag = percentageCreditUsedDirectionFlag
    self.changedScore = changedScore
    self.currentShortTermDebt = currentShortTermDebt
    self.currentShortTermNonPromotionalDebt = currentShortTermNonPromotionalDebt
    self.currentShortTermCreditLimit = currentShortTermCreditLimit
    self.currentShortTermCreditUtilisation = currentShortTermCreditUtilisation
    self.changeInShortTermDebt = changeInShortTermDebt
    self.currentLongTermDebt = currentLongTermDebt
    self.currentLongTermNonPromotionalDebt = currentLongTermNonPromotionalDebt
    self.currentLongTermCreditLimit = currentLongTermCreditLimit
    self.currentLongTermCreditUtilisation = currentLongTermCreditUtilisation
    self.changeInLongTermDebt = changeInLongTermDebt
    self.numPositiveScoreFactors = numPositiveScoreFactors
    self.numNegativeScoreFactors = numNegativeScoreFactors
    self.equifaxScoreBand = equifaxScoreBand
    self.equifaxScoreBandDescription = equifaxScoreBandDescription
    self.daysUntilNextReport = daysUntilNextReport
  }
}

// MARK: Convenience initializers

extension Credit {
  convenience init(data: Data) throws {
    let me = try JSONDecoder().decode(Credit.self, from: data)
    self.init(accountIDVStatus: me.accountIDVStatus, creditReportInfo: me.creditReportInfo, dashboardStatus: me.dashboardStatus, personaType: me.personaType, coachingSummary: me.coachingSummary, augmentedCreditScore: me.augmentedCreditScore)
  }
  
  convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  convenience init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension CoachingSummary {
  convenience init(data: Data) throws {
    let me = try JSONDecoder().decode(CoachingSummary.self, from: data)
    self.init(activeTodo: me.activeTodo, activeChat: me.activeChat, numberOfTodoItems: me.numberOfTodoItems, numberOfCompletedTodoItems: me.numberOfCompletedTodoItems, selected: me.selected)
  }
  
  convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  convenience init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension CreditReportInfo {
  convenience init(data: Data) throws {
    let me = try JSONDecoder().decode(CreditReportInfo.self, from: data)
    self.init(score: me.score, scoreBand: me.scoreBand, clientRef: me.clientRef, status: me.status, maxScoreValue: me.maxScoreValue, minScoreValue: me.minScoreValue, monthsSinceLastDefaulted: me.monthsSinceLastDefaulted, hasEverDefaulted: me.hasEverDefaulted, monthsSinceLastDelinquent: me.monthsSinceLastDelinquent, hasEverBeenDelinquent: me.hasEverBeenDelinquent, percentageCreditUsed: me.percentageCreditUsed, percentageCreditUsedDirectionFlag: me.percentageCreditUsedDirectionFlag, changedScore: me.changedScore, currentShortTermDebt: me.currentShortTermDebt, currentShortTermNonPromotionalDebt: me.currentShortTermNonPromotionalDebt, currentShortTermCreditLimit: me.currentShortTermCreditLimit, currentShortTermCreditUtilisation: me.currentShortTermCreditUtilisation, changeInShortTermDebt: me.changeInShortTermDebt, currentLongTermDebt: me.currentLongTermDebt, currentLongTermNonPromotionalDebt: me.currentLongTermNonPromotionalDebt, currentLongTermCreditLimit: me.currentLongTermCreditLimit, currentLongTermCreditUtilisation: me.currentLongTermCreditUtilisation, changeInLongTermDebt: me.changeInLongTermDebt, numPositiveScoreFactors: me.numPositiveScoreFactors, numNegativeScoreFactors: me.numNegativeScoreFactors, equifaxScoreBand: me.equifaxScoreBand, equifaxScoreBandDescription: me.equifaxScoreBandDescription, daysUntilNextReport: me.daysUntilNextReport)
  }
  
  convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  convenience init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

// MARK: Encode/decode helpers
class JSONNull: Codable {
  
  public init() {}
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}

