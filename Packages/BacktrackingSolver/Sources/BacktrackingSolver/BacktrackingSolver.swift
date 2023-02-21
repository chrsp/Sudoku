//
//  BacktrackingSolver.swift
//
//
//  Created by Charles Prado on 15/02/2023.
//

import Foundation
import Models

public struct BacktrackingSolver {

    public private(set) var game: Game
    
    public var didFinishSolving: (([Square]) -> Void)?
    public var didUpdateSolution: (([Square]) -> Void)?
    
    public init(game: Game) {
        self.game = game
    }
    
    public func solve() -> Bool {
        guard let firstEmptySquare = game.firstEmptySquare else {
            return true
        }

        for value in 1...9 where game.canAdd(value, to: firstEmptySquare) {
            firstEmptySquare.value = value
            didUpdateSolution?(game.board)
            if solve() {
                didFinishSolving?(game.board)
                return true
            }
            firstEmptySquare.value = 0
            didUpdateSolution?(game.board)
        }
        
        return false
    }
}
