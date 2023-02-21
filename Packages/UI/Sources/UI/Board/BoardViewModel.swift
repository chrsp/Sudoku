//
//  BoardViewModel.swift
//
//
//  Created by Charles Prado on 20/02/2023.
//

import Foundation
import BacktrackingSolver
import Models

public class BoardViewModel: ObservableObject {
    @Published var data: [Square]
    private var solver: BacktrackingSolver!

    public init(data: [[Int]]) {
        let game = Game(game: data)
        solver = .init(game: game)
        self.data = solver.game.board
//        
//        solver.didFinishSolving =  { newData in
//            self.data = newData
//        }

        solver.didUpdateSolution =  { newData in
            self.data = newData
        }
    }

    func solveSudoku() {
        let _ = solver.solve()
    }

    func squareViewModel(at row: Int, column: Int) -> SquareViewModel {
        SquareViewModel(square: data[row+9*column])
    }
}
