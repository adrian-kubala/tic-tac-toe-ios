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
  var player1 = Player(chooseCircle: true)
  var player2 = Player(chooseCircle: false)
  var turn = Symbol.circle
  
  @IBAction func makeMove(_ sender: FieldView) {
    if sender.isClicked {
      return
    }
    
    let fieldSymbol: Symbol
    if turn == .circle {
      sender.setImage(#imageLiteral(resourceName: "circle-sign"), for: .normal)
      fieldSymbol = .circle
    } else {
      sender.setImage(UIImage(named: "ex-sign"), for: .normal)
      fieldSymbol = .cross
    }
    
    sender.isClicked = true
    let fieldViewIndex = sender.index
    grid[fieldViewIndex].symbol = fieldSymbol
    grid[fieldViewIndex].isClicked = true
    
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
