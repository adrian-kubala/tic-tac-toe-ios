//
//  AIPlayer.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 24.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class AIPlayer: Player {
  func makeRandomMove() -> Int {
    let fieldNumber = Int(arc4random_uniform(9))
    return fieldNumber
  }
}
