//
//  UITextField+updatePoints.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 11.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

extension UITextField {
  func updatePoints(_ points: Int) {
    text = "\(points) points"
  }
}
