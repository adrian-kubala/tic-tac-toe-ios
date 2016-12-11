//
//  Turn.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 11.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

enum Symbol {
  case circle
  case cross
  
  mutating func swap() {
    switch self {
    case .circle:
      self = .cross
    case .cross:
      self = .circle
    }
  }
}
