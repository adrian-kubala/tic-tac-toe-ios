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
  @IBOutlet weak var gridView: GridView!
  
  let game = Game()
  
  override func viewDidLoad() {
    gridView.setupGrid()
  }
  
  @IBAction func makeMove(_ sender: FieldView) {
    if sender.symbol != nil {
      return
    }
    
    sender.update(with: game.turn)
    
    game.updateGridWith(symbol: sender.symbol!, at: sender.index)
    game.swapTurn()
    
    if gameDidEnd() {
      gridView.reset()
    }
  }
  
  private func gameDidEnd() -> Bool {
    guard game.hasWinner() else {
      if game.gridIsFull() {
        return true
      }
      return false
    }
    
    game.updatePoints()
    return true
  }
  
  @IBAction func endGame() {
    dismiss(animated: true, completion: nil)
  }
}
