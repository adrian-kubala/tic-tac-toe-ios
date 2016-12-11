//
//  Field.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 09.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class Field {
  var isClicked = false
  var isCircle: Bool!
  
  func reset() {
    isClicked = false
    isCircle = nil
  }
}
