//
//  CreditViewModel.swift
//  ClearScore
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
class CreditViewModel {
    let maxScore: Int
    let yourScore: Int
    init(maxScore: Int, yourScore: Int) {
        self.maxScore = maxScore
        self.yourScore = yourScore
    }
    init(credit: Credit) {
        self.maxScore = credit.creditReportInfo.maxScoreValue
        self.yourScore = credit.creditReportInfo.score
    }
}
