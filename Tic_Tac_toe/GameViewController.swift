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
  var isCircleTurn = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  @IBAction func makeMove(_ sender: FieldView) {
    if sender.isClicked {
      return
    }
    
    let fieldViewIsCircle: Bool
    if isCircleTurn {
      sender.setImage(#imageLiteral(resourceName: "circle-sign"), for: .normal)
      fieldViewIsCircle = true
    } else {
      sender.setImage(UIImage(named: "ex-sign"), for: .normal)
      fieldViewIsCircle = false
    }
    
    sender.isClicked = true
    let fieldViewIndex = sender.index
    grid.fields[fieldViewIndex].isCircle = fieldViewIsCircle
    grid.fields[fieldViewIndex].isClicked = true
    
    didGameEnd()
  }
  
  fileprivate func didGameEnd() -> Bool {
    guard grid.hasWinner() else {
      isCircleTurn = !isCircleTurn
      return false
    }
    
    updatePoints()
    return true
  }
  
  fileprivate func updatePoints() {
    if grid.circleIsWinner! {
      player1.addPoint()
      circleTextField.updatePoints(player1.points)
    } else {
      player2.addPoint()
      crossTextField.updatePoints(player2.points)
    }
  }
}
