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
  var isFull = false
  var circleIsWinner: Bool?
  
  subscript(index: Int) -> Field {
    get {
      return fields[index]
    }
    
    set {
      fields[index] = newValue
    }
  }
  
  init() {
    for _ in 0 ..< 9 {
      fields.append(Field())
    }
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
    let firstFieldIsCircle = fields[0].isCircle
    
    for field in fields {
      if field.isClicked && field.isCircle && firstFieldIsCircle! {
        continue
      } else if field.isClicked && !field.isCircle && !firstFieldIsCircle! {
        continue
      } else {
        return false
      }
    }
    
    circleIsWinner = firstFieldIsCircle! ? true : false
    resetFields()
    return true
  }
  
  fileprivate func resetFields() {
    for field in fields {
      field.reset()
    }
  }
}
