//
//  Player.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 09.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class Player {
  let symbol: Symbol
  var points = 0
  
  init(chooseSymbol symbol: Symbol) {
    self.symbol = symbol
  }
  
  func addPoint() {
    points += 1
  }
}
