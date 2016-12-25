//
//  TicTacToeGame.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 25.12.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import Foundation

protocol TicTacToeGame {
  var player1: Player { get }
  var player2: Player! { get }
  
  var grid: Grid { get }
  var turn: Symbol { get set }
  
  func swapTurn()
  func updateGridWith(symbol: Symbol, at index: Int)
  func hasWinner() -> Bool
  func gridIsFull() -> Bool
  func updatePoints()
}
