//
//  FieldView.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 09.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

class FieldView: UIButton {
  var symbol: Symbol?
  @IBInspectable var index: Int = 0
  
  func update(with symbol: Symbol) {
    self.symbol = symbol
    setImage(symbol.getImage(), for: .normal)
  }
  
  func reset() {
    symbol = nil
    setImage(nil, for: .normal)
  }
}
