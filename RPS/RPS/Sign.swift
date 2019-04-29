//
//  Sign.swift
//  RPS
//
//  Created by R Mat on 4/27/19.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
        return "👊"
        case .paper:
        return "✋"
        case .scissors:
        return "✌️"
        }
    }
    
    func play(_ opponentThrow: Sign) -> GameState {
        
        //likely could base off of player's throw to reduce LOC (if player chose this, check for opponent throw)
        
        //all draw options
        if ((self == .paper) && (opponentThrow == .paper)) {
            return .draw
        }
        else if ((self == .rock) && (opponentThrow == .rock)) {
            return .draw
        }
        else if ((self == .scissors) && (opponentThrow == .scissors)) {
            return .draw
        }//all win options
        else if ((self == .paper) && (opponentThrow == .rock)) {
            return .win
        }
        else if ((self == .scissors) && (opponentThrow == .paper)) {
            return .win
        }
        else if ((self == .rock) && (opponentThrow == .scissors)) {
            return .win
        }//all lose options
        else if ((self == .paper) && (opponentThrow == .scissors)) {
            return .lose
        }
        else if ((self == .scissors) && (opponentThrow == .rock)) {
            return .lose
        }
        else if ((self == .rock) && (opponentThrow == .paper)) {
            return .lose
        }
        else {
            //should not be reached
            return .start
        }
    }
}
