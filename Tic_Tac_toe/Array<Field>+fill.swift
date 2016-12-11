//
//  Array<Field>+fill.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 11.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

extension Array where Element: Field {
  mutating func fillWithFields(_ count: Int) {
    for _ in 0 ..< count {
      append(Field() as! Element)
    }
  }
}
