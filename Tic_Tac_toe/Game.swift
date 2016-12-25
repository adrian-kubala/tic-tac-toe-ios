//
//  Game.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 25.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

class Game: TicTacToeGame {
  let player1 = Player(with: Symbol.circle)
  let player2 = Player(with: Symbol.cross)
  
  let grid = Grid()
  var turn = Symbol.circle
  
  var winner: Player? {
    if let winner = grid.winner {
      if winner == .circle {
        return player1
      } else {
        return player2
      }
    }
    
    return nil
  }
  
  func swapTurn() {
    turn.swap()
  }
  
  func updateGridWith(symbol: Symbol, at index: Int) {
    grid[index].symbol = symbol
  }
  
  func gridIsFull() -> Bool {
    return grid.isFull
  }
  
  func hasWinner() -> Bool {
    return grid.hasWinner()
  }
  
  func updatePoints() {
    if grid.winner == .circle {
      player1.addPoint()
    } else {
      player2.addPoint()
    }
  }
  
}
