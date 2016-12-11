//
//  GridView.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 11.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

class GridView: UIView {
  @IBOutlet var fieldViews: [FieldView]!
  
  subscript(index: Int) -> FieldView {
    get {
      return fieldViews[index]
    }
    
    set {
      fieldViews[index] = newValue
    }
  }
  
  func fill(with views: [FieldView]) {
    fieldViews.append(contentsOf: views)
  }
  
  func reset() {
    for fieldView in fieldViews {
      fieldView.reset()
    }
  }
}
