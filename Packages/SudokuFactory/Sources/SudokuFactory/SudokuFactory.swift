//
//  SudokuFactory.swift
//
//
//  Created by Charles Prado on 21/02/2023.
//

import Models

public struct SudokuFactory {
    public init() {

    }
    
    public func createSudoku() -> Game {
        let game = Game(game: Game.newGame())
        
        var starters = Array(1...9)
        
        let numberOfElementsToRemove = Int.random(in: 1...2)
        for _ in 1...numberOfElementsToRemove {
            if let randomIndex = starters.indices.randomElement() {
                starters.remove(at: randomIndex)
            }
        }
        
        let numberOfElementsToAdd = Int.random(in: 1...30)
        for _ in 1...numberOfElementsToAdd {
            let randomElement = Int.random(in: 1...9)
            starters.append(randomElement)
        }
        
        while starters.count > 0 {
            let indexToAddValue = Int.random(in: 0...80)
            guard let valueToAdd = starters.last else { continue }
            if game.board[indexToAddValue].value == 0 && game.canAdd(valueToAdd, to: game.board[indexToAddValue]) {
                game.board[indexToAddValue].value = valueToAdd
                let _ = starters.popLast()
            }
        }
        
        return game
    }
}
