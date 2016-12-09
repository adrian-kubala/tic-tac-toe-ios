//
//  Player.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 09.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class Player {
  let isCircle: Bool
  var points = 0
  
  init(chooseCircle isCircle: Bool) {
    self.isCircle = isCircle
  }
}
