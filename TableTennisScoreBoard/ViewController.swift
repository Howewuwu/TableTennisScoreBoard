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
    
    var deuceball = false
    var ballCount = 0
    
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
    
    
    @IBOutlet weak var deuceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        deuceLabel.isHidden = true
        player1ScoreLabel.text = "\(player1Score)"
        player2ScoreLabel.text = "\(player2Score)"
        player1RoundScoreLabel.text = "\(player1RoundScore)"
        player2RoundScoreLabel.text = "\(player2RoundScore)"
        rightServeLabel.isHidden = true
        
        
    }
    // MARK: - viewDidLoad Over
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func player1ScorePlus(_ sender: UIButton) {
        player1Score += 1
        player1ScoreLabel.text = "\(player1Score)"
        ballCount += 1
        changeServe()
        scorePlus()

        
        
    }
    
    
    
    
    
    @IBAction func player2ScorePlus(_ sender: UIButton) {
        player2Score += 1
        player2ScoreLabel.text = "\(player2Score)"
        ballCount += 1
        changeServe()
        scorePlus()
        
    }
    
    
    
    
    @IBAction func player1RoundScorePlus(_ sender: UIButton) {
        player1RoundScore += 1
        player1RoundScoreLabel.text = "\(player1RoundScore)"
    }
    
    
    
    
    @IBAction func play2RoundScorePlus(_ sender: UIButton) {
        player2RoundScore += 1
        player2RoundScoreLabel.text = "\(player2RoundScore)"
    }
    
    
    
    
    
    
    @IBAction func resetEveryThing(_ sender: UIButton) {
        player1Score = 0
        player2Score = 0
        player1RoundScore = 0
        player2RoundScore = 0
        ballCount = 0
        deuceball = false
        player1ScoreLabel.text = "\(player1Score)"
        player2ScoreLabel.text = "\(player2Score)"
        player1RoundScoreLabel.text = "\(player1RoundScore)"
        player2RoundScoreLabel.text = "\(player2RoundScore)"
        deuceLabel.isHidden = true
        rightServeLabel.isHidden = true
        leftServeLabel.isHidden = false
    }
    
    
    
    
    
    func scorePlus () {
        if !deuceball {
            if player1Score == 11 {
                player1RoundScore += 1
                player1RoundScoreLabel.text = "\(player1RoundScore)"
                player1Score = 0
                player1ScoreLabel.text = "\(player1Score)"
                player2Score = 0
                player2ScoreLabel.text = "\(player2Score)"
                ballCount = 0
            } else if player2Score == 11 {
                player2RoundScore += 1
                player2RoundScoreLabel.text = "\(player2RoundScore)"
                player1Score = 0
                player1ScoreLabel.text = "\(player1Score)"
                player2Score = 0
                player2ScoreLabel.text = "\(player2Score)"
                ballCount = 0
            } else if player1Score == 10 && player2Score == 10 {
                deuceball = true
                deuceLabel.isHidden = false
            }
        } else {
            deuceStart()
        }
    }
    
    
    
    func deuceStart () {
        //ballCount = 2
        let winPoint = player1Score - player2Score
        
        if winPoint == 2 {
            player1RoundScore += 1
            player1RoundScoreLabel.text = "\(player1RoundScore)"
            player1Score = 0
            player1ScoreLabel.text = "\(player1Score)"
            player2Score = 0
            player2ScoreLabel.text = "\(player2Score)"
            ballCount = 0
            deuceball = false
            deuceLabel.isHidden = true
        } else if winPoint == -2 {
            player2RoundScore += 1
            player2RoundScoreLabel.text = "\(player2RoundScore)"
            player1Score = 0
            player1ScoreLabel.text = "\(player1Score)"
            player2Score = 0
            player2ScoreLabel.text = "\(player2Score)"
            ballCount = 0
            deuceball = false
            deuceLabel.isHidden = true
        }
    }
    
    
    
    
    
    
    
    
    
    
    func changeServe () {
        if ballCount == 2 {
            if leftServeLabel.isHidden == false {
                leftServeLabel.isHidden = true
                rightServeLabel.isHidden = false
            }
            else if rightServeLabel.isHidden == false {
                rightServeLabel.isHidden = true
                leftServeLabel.isHidden = false
            }
            ballCount = 0
        }
        
        
        
        
        
    }
    
}
