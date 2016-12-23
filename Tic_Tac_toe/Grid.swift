//
//  Grid.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 09.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class Grid {
  var fields = [Field]()
  var isFull: Bool {
    for field in fields {
      if field.symbol == nil {
        return false
      }
    }
    
    resetFields()
    return true
  }
  var winner: Symbol?
  
  subscript(index: Int) -> Field {
    get {
      return fields[index]
    }
    
    set {
      fields[index] = newValue
    }
  }
  
  init() {
    fields.fillWithFields(9)
  }
  
  func hasWinner() -> Bool {
    if allFieldsAreClicked(fields[0], fields[1], fields[2])
    || allFieldsAreClicked(fields[3], fields[4], fields[5])
    || allFieldsAreClicked(fields[6], fields[7], fields[8])
      
    || allFieldsAreClicked(fields[0], fields[3], fields[6])
    || allFieldsAreClicked(fields[1], fields[4], fields[7])
    || allFieldsAreClicked(fields[2], fields[5], fields[8])
    
    || allFieldsAreClicked(fields[0], fields[4], fields[8])
    || allFieldsAreClicked(fields[2], fields[4], fields[6]) {
      return true
    }
    
    return false
  }
  
  fileprivate func allFieldsAreClicked(_ fields: Field...) -> Bool {
    let firstFieldToCheckSymbol = fields[0].symbol
    
    for field in fields {
      if field.symbol == .circle && firstFieldToCheckSymbol == .circle  {
        continue
      } else if field.symbol == .cross && firstFieldToCheckSymbol == .cross {
        continue
      } else {
        return false
      }
    }
    
    winner = firstFieldToCheckSymbol
    resetFields()
    return true
  }
  
  fileprivate func resetFields() {
    for field in fields {
      field.reset()
    }
  }
}
