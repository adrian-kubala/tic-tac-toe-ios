//
//  Grid.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 09.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class Grid {
  private var fields = [Field]()
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
    if threeFieldsAreClicked(fields[0], fields[1], fields[2])
    || threeFieldsAreClicked(fields[3], fields[4], fields[5])
    || threeFieldsAreClicked(fields[6], fields[7], fields[8])
      
    || threeFieldsAreClicked(fields[0], fields[3], fields[6])
    || threeFieldsAreClicked(fields[1], fields[4], fields[7])
    || threeFieldsAreClicked(fields[2], fields[5], fields[8])
    
    || threeFieldsAreClicked(fields[0], fields[4], fields[8])
    || threeFieldsAreClicked(fields[2], fields[4], fields[6]) {
      return true
    }
    
    return false
  }
  
  private func threeFieldsAreClicked(_ fields: Field...) -> Bool {
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
  
  private func resetFields() {
    for field in fields {
      field.reset()
    }
  }
}
