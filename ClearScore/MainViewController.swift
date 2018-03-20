//
//  ViewController.swift
//  ClearScore
//
//  Created by Diego Caridei on 20/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit
import UICircularProgressRing
class MainViewController: UIViewController {
  @IBOutlet weak var outOfLabel: UILabel!
  @IBOutlet weak var yourCreditLabel: UILabel!
  @IBOutlet weak var progressRing: UICircularProgressRingView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DataProvider.fetchCredit { (credit) in
      self.progressRing.minValue = 0
      self.progressRing.maxValue = CGFloat(credit.maxScore)
      self.progressRing.setProgress(value: CGFloat(credit.yourScore), animationDuration: 2)
      self.outOfLabel.text = "Out of \(String(credit.maxScore))"
    }
  }
  
}

