//
//  GameState.swift
//  RPS
//
//  Created by R Mat on 4/28/19.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    func gameStateText() -> String {
        switch self {
        case .start:
            return "START"
        case .win:
            return "YOU WIN!"
        case .lose:
            return "YOU LOSE..."
        case .draw:
            return "DRAW"
        }
    }
}
