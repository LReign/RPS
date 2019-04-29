//
//  ViewController.swift
//  RPS
//
//  Created by R Mat on 4/27/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.gray
        updateUI(.start)
    }

    @IBOutlet weak var appSign: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var playerSignRock: UIButton!
    
    @IBAction func playerSignRockAction(_ sender: Any) {
        let playerChoice = Sign.rock
        play(playerChoice)
    }
    
    
    @IBOutlet weak var playerSignScissors: UIButton!
    
    @IBAction func playerSignScissorsAction(_ sender: Any) {
        let playerChoice = Sign.scissors
        play(playerChoice)
    }
    
    @IBOutlet weak var playerSignPaper: UIButton!
    
    @IBAction func playerSignPaperAction(_ sender: Any) {
        let playerChoice = Sign.paper
        play(playerChoice)
    }
    
    
    @IBOutlet weak var playAgain: UIButton!
    
    
    @IBAction func playAgainAction(_ sender: Any) {
        updateUI(.start)
    }
    
    func updateUI(_ currState: GameState) {
        switch currState {
            //sign = "🤖", make Play Again Button Hidden, Enable & Show all Player Sign Buttons
        case .start:
            appSign.text = "🤖"
            playAgain.isHidden = true
            enableShowSigns()
            self.view.backgroundColor = UIColor.gray
            //break
        case .lose:
            appSign.text = currState.gameStateText()
            self.view.backgroundColor = UIColor.red
            //break
        case .win:
            appSign.text = currState.gameStateText()
            //not Green due to Red/Green Colorblindness
            self.view.backgroundColor = UIColor.blue
            //break
        case .draw:
            appSign.text = currState.gameStateText()
            self.view.backgroundColor = UIColor.brown
            //break
        }
        
//        if currState == .start {
//            appSign.text = "🤖"
//            playAgain.isHidden = true
//            enableShowSigns()
//            self.view.backgroundColor = UIColor.gray
//        }
//        else if currState == .lose {
//            appSign.text = currState.gameStateText()
//            self.view.backgroundColor = UIColor.red
//        }
//        else if currState == .win {
//            appSign.text = currState.gameStateText()
//            self.view.backgroundColor = UIColor.blue
//        }
//        else if currState == .draw {
//            appSign.text = currState.gameStateText()
//            self.view.backgroundColor = UIColor.brown
//        }
//        else {
//            //should not be reached
//        }
    }
    
    //Un-Hides signs & Enables signs
    func enableShowSigns() {
        playerSignRock.isHidden = false
        playerSignRock.isEnabled = true
        playerSignPaper.isEnabled = true
        playerSignPaper.isHidden = false
        playerSignScissors.isEnabled = true
        playerSignScissors.isHidden = false
    }
    
    //randomly get app's choice, compute the GameState & call updateUI, disable & hide options, show play again button, set the appSign to the app's choice emoji
    func play(_ playerChoice: Sign) {
        let compChoice = randomSign()
        appSign.text = compChoice.emoji
        let endGameState = playerChoice.play(compChoice)
        updateUI(endGameState)
        hideAndDisableOtherChoices(playerChoice)
        playAgain.isHidden = false
    }
    
    func hideAndDisableOtherChoices(_ playerChoice: Sign) {
        playerSignRock.isEnabled = false
        playerSignScissors.isEnabled = false
        playerSignPaper.isEnabled = false
        
        if (playerChoice == .rock) {
            playerSignPaper.isHidden = true
            playerSignScissors.isHidden = true
        }
        else if (playerChoice == .paper) {
            playerSignRock.isHidden = true
            playerSignScissors.isHidden = true
        }
        else if (playerChoice == .scissors) {
            playerSignRock.isHidden = true
            playerSignPaper.isHidden = true
        }
        else {
            //should not be here, but just in case, re-enable choices to ensure no soft-lock
            playerSignRock.isEnabled = true
            playerSignScissors.isEnabled = true
            playerSignPaper.isEnabled = true
        }
    }
}

