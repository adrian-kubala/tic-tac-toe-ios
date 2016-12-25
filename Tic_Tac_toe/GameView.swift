//
//  GameView.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 25.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

class GameView: UIView {
  @IBOutlet weak var circleTextField: UITextField!
  @IBOutlet weak var crossTextField: UITextField!
  @IBOutlet weak var gridView: GridView!

  
  func setupGridView() {
    gridView.setupGrid()
  }
  
  func resetGridView() {
    gridView.reset()
  }
  
  func updatePlayerPoints(player: Player) {
    if player.symbol == .circle {
      circleTextField.updatePoints(player.points)
    } else {
      crossTextField.updatePoints(player.points)
    }
  }
}
