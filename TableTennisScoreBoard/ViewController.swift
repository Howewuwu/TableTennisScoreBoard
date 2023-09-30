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
    
    var scoreHistory : [(player01: Int, player02: Int)] = [(0,0)]
    
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
        if ballCount == 2 {
            ballCount = 0
        }
        ballCount += 1
        player1Score += 1
        player1ScoreLabel.text = "\(player1Score)"
        scoreHistory.append((player01: player1Score, player02: player2Score))
        
        roundScorePlus()
        changeServe()
        
        
        
        
    }
    
    
    
    
    
    @IBAction func player2ScorePlus(_ sender: UIButton) {
        if ballCount == 2 {
            ballCount = 0
        }
        ballCount += 1
        player2Score += 1
        player2ScoreLabel.text = "\(player2Score)"
        scoreHistory.append((player01: player1Score, player02: player2Score))
        
        roundScorePlus()
        changeServe()
        
        
        
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
        player1NameTextfield.text = ""
        player2NameTextfield.text = ""
        scoreHistory = [(0,0)]
        view.backgroundColor = UIColor.systemCyan
    }
    
    
    
    
    
    
    @IBAction func changeSide(_ sender: UIButton) {
        let player1Name = player1NameTextfield.text
        let player2Name = player2NameTextfield.text
        
        let player1RS = player1RoundScore
        let player2RS = player2RoundScore
        
        let player1S = player1Score
        let player2S = player2Score
        
        player1NameTextfield.text = player2Name
        player2NameTextfield.text = player1Name
        
        player1RoundScoreLabel.text = "\(player2RS)"
        player1RoundScore = player2RS
        player2RoundScoreLabel.text = "\(player1RS)"
        player2RoundScore = player1RS
        
        player1ScoreLabel.text = "\(player2S)"
        player1Score = player2S
        player2ScoreLabel.text = "\(player1S)"
        player2Score = player1S
        
        if leftServeLabel.isHidden == false {
            leftServeLabel.isHidden = true
            rightServeLabel.isHidden = false
        }
        else if rightServeLabel.isHidden == false {
            rightServeLabel.isHidden = true
            leftServeLabel.isHidden = false
        }
        
    }
    
    
    
    
    
    @IBAction func rewind(_ sender: UIButton) {
        if scoreHistory.count > 1 {
            scoreHistory.removeLast()
            let previousScores = scoreHistory.last!
            player1ScoreLabel.text = String(previousScores.player01)
            player2ScoreLabel.text = String(previousScores.player02)
            
            print("\(ballCount)")
            
            if ballCount == 0 {
                ballCount = 2
                changeServe()
            }
            
            
            player1Score = previousScores.player01
            player2Score = previousScores.player02
            changeServe()
            ballCount += 1
            
        }
    }
    
    
    @IBAction func selectColor(_ sender: UIButton) {
        // 創建 UIAlertController
        let alertController = UIAlertController(title: "選擇顏色", message: "請選擇一個背景顏色", preferredStyle: .actionSheet)
        
        // 添加顏色選項
        let redAction = UIAlertAction(title: "紅色", style: .default) { (_) in
            self.view.backgroundColor = UIColor.red
        }
        
        let blueAction = UIAlertAction(title: "藍色", style: .default) { (_) in
            self.view.backgroundColor = UIColor.blue
        }
        
        let greenAction = UIAlertAction(title: "綠色", style: .default) { (_) in
            self.view.backgroundColor = UIColor.green
        }
        
        let grayAction = UIAlertAction(title: "灰色", style: .default) { UIAlertAction in
            self.view.backgroundColor = UIColor.systemGray
        }
        
        // 添加“取消”選項
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        // 將所有選項添加到 alertController 中
        alertController.addAction(redAction)
        alertController.addAction(blueAction)
        alertController.addAction(greenAction)
        alertController.addAction(cancelAction)
        alertController.addAction(grayAction)
        
        // 顯示 alertController
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    func roundScorePlus () {
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
        ballCount = 2
        let winPoint = player1Score - player2Score
        
        if winPoint == 2 {
            player1RoundScore += 1
            player1RoundScoreLabel.text = "\(player1RoundScore)"
            player1Score = 0
            player1ScoreLabel.text = "\(player1Score)"
            player2Score = 0
            player2ScoreLabel.text = "\(player2Score)"
            //ballCount = 1
            deuceball = false
            deuceLabel.isHidden = true
        } else if winPoint == -2 {
            player2RoundScore += 1
            player2RoundScoreLabel.text = "\(player2RoundScore)"
            player1Score = 0
            player1ScoreLabel.text = "\(player1Score)"
            player2Score = 0
            player2ScoreLabel.text = "\(player2Score)"
            //ballCount = 1
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
