//
//  ViewController.swift
//  TableTennisScoreBoard
//
//  Created by Howe on 2023/9/28.
//

import UIKit

class ViewController: UIViewController {
    
    var player1Score = 0
    var player1RoundScore = 0
    var player2Score = 0
    var player2RoundScore = 0
    
    
    @IBOutlet weak var player1RoundScoreLabel: UILabel!
    @IBOutlet weak var player1RoundScoreButtonOutlet: UIButton!
    @IBOutlet weak var player1NameTextfield: UITextField!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player1ScoreButtonOutlet: UIButton!
    
    @IBOutlet weak var leftServeLabel: UILabel!
    
    
    @IBOutlet weak var player2RoundScoreLabel: UILabel!
    @IBOutlet weak var player2RoundScoreButtonOutlet: UIButton!
    @IBOutlet weak var player2NameTextfield: UITextField!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreButtonOutlet: UIButton!
    
    @IBOutlet weak var rightServeLabel: UILabel!
    
    
    @IBOutlet weak var duceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        
    }
    // MARK: - viewDidLoad Over
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

