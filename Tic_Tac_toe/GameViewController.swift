//
//  ViewController.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 19.11.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  @IBOutlet var gameView: GameView!
  
  var game: Game!
  
  var timer: Timer?
  
  override func viewDidLoad() {
    gameView.setupGridView()
  }
  
  @IBAction func makeMove(_ sender: FieldView) {
    if sender.symbol != nil {
      return
    }
    
    sender.update(with: game.turn)
    
    game.updateGridWith(symbol: sender.symbol!, at: sender.index)
    game.swapTurn()
    
    if gameDidEnd() {
      gameView.resetGridView()
    }
    
    if game.turn == .cross && game.player2 is AIPlayer {
      let aiPlayer = game.player2 as! AIPlayer
      var fieldIndex: Int!
      while true {
        fieldIndex = aiPlayer.makeRandomMove()
        if game.grid[fieldIndex].symbol == nil {
          break
        }
      }
      
      let timeInterval = TimeInterval(arc4random_uniform(3) + 1)
      timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] (timer) in
        self?.makeMove((self?.gameView.gridView[fieldIndex])!)
        print(timeInterval)
      }
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
    gameView.updatePlayerPoints(player: game.winner!)
    return true
  }
  
  @IBAction func endGame() {
    dismiss(animated: true, completion: nil)
  }
}
