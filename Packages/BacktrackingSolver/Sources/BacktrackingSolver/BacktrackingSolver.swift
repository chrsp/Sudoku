//
//  BacktrackingSolver.swift
//
//
//  Created by Charles Prado on 15/02/2023.
//

import Foundation
import GameEngine

public class BacktrackingSolver {

    public var game: Game {
        didSet {
            interactionIdx = 0
        }
    }
    
    public var didFinishSolving: (([Square]) -> Void)?
    public var didUpdateSolution: (([Square]) -> Void)?
    public var dispatcher: DispatchGroup?
    
    private var interactionIdx = 0
    
    public init(game: Game) {
        self.game = game
    }
    
    public func solve() -> Bool {
        dispatcher?.enter()
        
        let maxNumberOfInteractions = 50000
        
        guard let firstEmptySquare = game.firstEmptySquare else {
            return true
        }
        
        guard interactionIdx <= maxNumberOfInteractions else {
            return false
        }
        
        for value in 1...9 where game.canAdd(value, to: firstEmptySquare) {
            firstEmptySquare.value = value
            didUpdateSolution?(game.board)
            dispatcher?.wait()
            self.interactionIdx += 1
            if solve() {
                didFinishSolving?(game.board)
                return true
            }
            firstEmptySquare.value = 0
            didUpdateSolution?(game.board)
            dispatcher?.wait()
        }
        
        return false
    }
    
    public func solveNextStep() {
        if dispatcher == nil {
            dispatcher = DispatchGroup()
            startSudokuSolver()
        } else {
            stopSudokuSolver()
        }
    }
}

// MARK: - Step By Step Solving
private extension BacktrackingSolver {
    func startSudokuSolver() {
        DispatchQueue.global(qos: .userInteractive).async {
            let _ = self.solve()
        }
    }
    
    func stopSudokuSolver() {
        dispatcher?.leave()
    }
}
