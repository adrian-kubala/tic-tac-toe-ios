//
//  MainMenuViewController.swift
//  Tic_Tac_toe
//
//  Created by Adrian Kubała on 25.11.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
  @IBOutlet weak var onePlayerSwitch: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier, identifier == "showGameViewController" {
      let destinationVC = segue.destination as! GameViewController
      present(destinationVC, animated: true, completion: nil)
      destinationVC.game = Game(onePlayerSwitch.isOn)
    }
  }
}
