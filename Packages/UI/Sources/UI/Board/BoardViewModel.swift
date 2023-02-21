//
//  BoardViewModel.swift
//
//
//  Created by Charles Prado on 20/02/2023.
//

import Foundation
import BacktrackingSolver
import GameEngine
import SudokuFactory

public class BoardViewModel: ObservableObject {
    @Published var data: [Square]
    
    private var factory: SudokuFactory
    private var solver: BacktrackingSolver

    public init(data: [[Int]]) {
        let game = Game(game: data)
        factory = .init()
        solver = .init(game: game)
        
        self.data = solver.game.board
    }
    
    func createSudoku() {
        guard let newSudoku = factory.createSudoku() else {
            return 
        }
        solver.game = newSudoku
        data = newSudoku.board
    }

    func solveSudoku() {
        solver.dispatcher = nil
        solver.didUpdateSolution = nil
        
        solver.didFinishSolving = { newData in
            DispatchQueue.main.async {
                self.data = newData
            }
        }
        
        DispatchQueue.main.async {
            let _ = self.solver.solve()
        }
    }
    
    func solveSudokuStepByStep() {
        solver.didUpdateSolution = { newData in
            DispatchQueue.main.async {
                self.data = newData
            }
        }
        
        solver.solveNextStep()
    }
    
    func squareViewModel(at row: Int, column: Int) -> SquareViewModel {
        SquareViewModel(square: data[row+9*column])
    }
}
