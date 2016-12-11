//
//  ViewController.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 19.11.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  @IBOutlet weak var circleTextField: UITextField!
  @IBOutlet weak var crossTextField: UITextField!
  
  let grid = Grid()
  var player1 = Player(with: Symbol.circle)
  var player2 = Player(with: Symbol.cross)
  var turn = Symbol.circle
  
  @IBAction func makeMove(_ sender: FieldView) {
    if sender.symbol != nil {
      return
    }
    
    sender.update(with: turn)

    let fieldViewIndex = sender.index
    grid[fieldViewIndex].symbol = sender.symbol
    
    let _ = didGameEnd()
  }
  
  fileprivate func didGameEnd() -> Bool {
    guard grid.hasWinner() else {
      turn.swap()
      return false
    }
    
    updatePoints()
    return true
  }
  
  fileprivate func updatePoints() {
    if grid.winner == .circle {
      player1.addPoint()
      circleTextField.updatePoints(player1.points)
    } else {
      player2.addPoint()
      crossTextField.updatePoints(player2.points)
    }
  }
}
