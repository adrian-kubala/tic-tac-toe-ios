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
  var isCircleTurn = true
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  @IBAction func makeMove(_ sender: FieldView) {
    if sender.isClicked {
      return
    }
    
    if isCircleTurn {
      sender.setImage(#imageLiteral(resourceName: "circle-sign"), for: .normal)
    } else {
      sender.setImage(UIImage(named: "ex-sign"), for: .normal)
    }
    
    sender.isClicked = !sender.isClicked
    isCircleTurn = !isCircleTurn
  }
}
